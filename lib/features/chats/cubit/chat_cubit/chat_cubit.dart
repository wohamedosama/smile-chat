// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_chat/features/chats/model/chat_model.dart';
import 'package:smile_chat/features/chats/model/message_model.dart';
import 'package:smile_chat/utils/constant.dart';
import 'package:smile_chat/utils/firebase_error_text/firestore_error_text.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());
  final firestore = FirebaseFirestore.instance;

  /// Generate a unique chat ID for two users
  String generateChatId(String userId1, String userId2) {
    final users = [userId1, userId2]..sort();
    return users.join('_');
  }

  /// Load all chats for a user from their subcollection
  Future<List<ChatModel>> loadAllChats(String userEmail) async {
    if (userEmail.isEmpty) {
      emit(state.copyWith(
        isLoadingChats: false,
        errorMessage: 'User not authenticated',
      ));
      return [];
    }

    try {
      emit(state.copyWith(isLoadingChats: true, errorMessage: ''));

      // Get user's chat IDs from their document
      final userDoc =
          await firestore.collection(usersCollections).doc(userEmail).get();

      if (!userDoc.exists) {
        print('User document does not exist for $userEmail');
        emit(state.copyWith(allChats: [], isLoadingChats: false));
        return [];
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final chatIds = List<String>.from(userData['chats'] ?? []);
      List<ChatModel> allChats = [];

      // Load chat details for each chat ID
      for (String chatId in chatIds) {
        final userIds = chatId.split('_');
        final otherUserId =
            userIds.firstWhere((id) => id != userEmail, orElse: () => '');

        if (otherUserId.isEmpty) continue;

        // Get other user's information
        final otherUserDoc =
            await firestore.collection(usersCollections).doc(otherUserId).get();
        String otherUserName = otherUserId;
        String otherUserImage = '';
        bool isOnline = false;

        if (otherUserDoc.exists) {
          final otherUserData = otherUserDoc.data() as Map<String, dynamic>;
          otherUserName =
              otherUserData['name'] ?? otherUserData['email'] ?? otherUserId;
          otherUserImage = otherUserData['image'] ?? '';
          isOnline = otherUserData['isOnline'] ?? false;
        }

        // Get last message from user's messages subcollection
        final lastMessageQuery = await firestore
            .collection(usersCollections)
            .doc(userEmail)
            .collection('messages')
            .where('chatId', isEqualTo: chatId)
            .orderBy('messageTime', descending: true)
            .limit(1)
            .get();

        String lastMessage = 'No messages yet';
        Timestamp lastMessageTime = Timestamp.now();

        if (lastMessageQuery.docs.isNotEmpty) {
          final lastMsg = lastMessageQuery.docs.first.data();
          lastMessage = lastMsg['message'] ?? 'No messages yet';
          lastMessageTime = lastMsg['messageTime'] ?? Timestamp.now();
        }

        final chat = ChatModel(
          chatId: otherUserId,
          participants: [userEmail, otherUserId],
          lastMessage: lastMessage,
          lastMessageTime: lastMessageTime,
          name: otherUserName,
          image: otherUserImage,
          isOnline: isOnline,
          unReadMessagsCount: 0,
        );

        allChats.add(chat);
      }

      // Sort by last message time
      allChats.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));

      print('Loaded ${allChats.length} chats for $userEmail');
      emit(state.copyWith(allChats: allChats, isLoadingChats: false));
      return allChats;
    } catch (error) {
      print('Error loading chats: $error');
      String errorMessage =
          FirestoreErrorUtils.getErrorMessage(error.toString());

      emit(state.copyWith(errorMessage: errorMessage, isLoadingChats: false));
      return [];
    }
  }

  /// Load messages for a specific chat from user's subcollection
  Future<void> loadMessages(String userId, String chatId) async {
    if (userId.isEmpty || chatId.isEmpty) {
      emit(state.copyWith(
          errorMessage: 'Invalid userId or chatId', isLoadingMessages: false));
      return;
    }

    try {
      emit(state.copyWith(isLoadingMessages: true, errorMessage: ''));

      final query = await firestore
          .collection(usersCollections)
          .doc(userId)
          .collection('messages')
          .where('chatId', isEqualTo: chatId)
          .orderBy('messageTime', descending: true)
          .get();

      final messages =
          query.docs.map((doc) => MessageModel.fromJson(doc)).toList();

      emit(state.copyWith(
          allMessages: messages, isLoadingMessages: false, errorMessage: ''));
    } catch (error) {
      print("Error loading messages: $error");
      String errorMessage =
          FirestoreErrorUtils.getErrorMessage(error.toString());

      emit(
          state.copyWith(isLoadingMessages: false, errorMessage: errorMessage));
    }
  }

  /// Add a message to both users' subcollections
  Future<void> addMessage(
      String currentUserId, String otherUserId, MessageModel model) async {
    try {
      emit(state.copyWith(isSendingMessage: true));

      final chatId = generateChatId(currentUserId, otherUserId);

      // Fetch current user's name and image
      final currentUserDoc =
          await firestore.collection(usersCollections).doc(currentUserId).get();
      String currentUserName = currentUserId;
      String currentUserImage = '';
      if (currentUserDoc.exists) {
        final userData = currentUserDoc.data() as Map<String, dynamic>;
        currentUserName = userData['name'] ?? currentUserId;
        currentUserImage = userData['image'] ?? '';
      }

      // Create message with full details
      final messageWithDetails = model.copyWith(
        chatId: chatId,
        userId: currentUserId,
        name: currentUserName,
        image: currentUserImage,
        createdAt: Timestamp.now(),
        messageTime: Timestamp.now(),
      );

      // Add message to current user's messages subcollection
      final currentUserRef = firestore
          .collection(usersCollections)
          .doc(currentUserId)
          .collection('messages')
          .doc();
      await currentUserRef
          .set(messageWithDetails.copyWith(id: currentUserRef.id).toJson());

      // Add message to other user's messages subcollection
      final otherUserRef = firestore
          .collection(usersCollections)
          .doc(otherUserId)
          .collection('messages')
          .doc();
      await otherUserRef
          .set(messageWithDetails.copyWith(id: otherUserRef.id).toJson());

      // Update both users' chat lists
      await _updateUserChatList(currentUserId, chatId);
      await _updateUserChatList(otherUserId, chatId);

      // Reload chats to reflect the new message
      await loadAllChats(currentUserId);

      emit(state.copyWith(isSendingMessage: false));
    } catch (error) {
      print("Failed to send message: $error");
      String errorMessage =
          FirestoreErrorUtils.getErrorMessage(error.toString());

      emit(state.copyWith(isSendingMessage: false, errorMessage: errorMessage));
    }
  }

  /// Update user's chat list in their document
  Future<void> _updateUserChatList(String userId, String chatId) async {
    try {
      await firestore.collection(usersCollections).doc(userId).set({
        'chats': FieldValue.arrayUnion([chatId])
      }, SetOptions(merge: true));
      print('Updated chat list for $userId with chatId: $chatId');
    } catch (error) {
      print("Failed to update chat list for user $userId: $error");
    }
  }

  /// Delete all messages for a chat from current user's subcollection
  Future<void> deleteAllMessages(String userId, String chatId) async {
    try {
      emit(state.copyWith(isLoadingMessages: true));

      // Get all messages for the chat
      final query = await firestore
          .collection(usersCollections)
          .doc(userId)
          .collection('messages')
          .where('chatId', isEqualTo: chatId)
          .get();

      if (query.docs.isEmpty) {
        emit(state.copyWith(
          isLoadingMessages: false,
          errorMessage: "No messages found to delete",
        ));
        return;
      }

      // Delete all messages in batch
      final batch = firestore.batch();
      for (final doc in query.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();

      // Clear messages from state and reload chats
      emit(state.copyWith(
          allMessages: [], isLoadingMessages: false, errorMessage: ''));
      await loadAllChats(userId);

      print("Deleted ${query.docs.length} messages for chatId: $chatId");
    } catch (error) {
      print("Failed to delete messages: $error");
      String errorMessage =
          FirestoreErrorUtils.getErrorMessage(error.toString());

      emit(
          state.copyWith(isLoadingMessages: false, errorMessage: errorMessage));
    }
  }

  /// Listen to real-time messages for a specific chat
  void listenToMessages(String userId, String chatId) {
    firestore
        .collection(usersCollections)
        .doc(userId)
        .collection('messages')
        .where('chatId', isEqualTo: chatId)
        .orderBy('messageTime', descending: true)
        .snapshots()
        .listen((snapshot) {
      final messages =
          snapshot.docs.map((doc) => MessageModel.fromJson(doc)).toList();
      emit(state.copyWith(allMessages: messages, isLoadingMessages: false));
    }, onError: (error) {
      String errorMessage =
          FirestoreErrorUtils.getErrorMessage(error.toString());

      emit(
          state.copyWith(isLoadingMessages: false, errorMessage: errorMessage));
    });
  }

  /// Reinitialize chats on login or device switch
  Future<void> reinitializeChats(String userEmail) async {
    await loadAllChats(userEmail);
  }
}

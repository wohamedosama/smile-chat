// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_chat/features/chats/model/message_model.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/utils/constant.dart';

part 'custom_state.dart';

class CustomCubit extends Cubit<CustomState> {
  CustomCubit() : super(const CustomState());
  final firestore = FirebaseFirestore.instance;

  String generateChatId(String userId1, String userId2) {
    final users = [userId1, userId2]..sort();
    return users.join('_');
  }

  Future<List<ChatModel>> loadAllChats(String? userEmail) async {
    if (userEmail == null) {
      emit(state.copyWith(
        isLoadingChats: false,
        errorMessage: 'User no authentiacted',
      ));
    }

    try {
      emit(state.copyWith(isLoadingChats: true));

      final query = await firestore
          .collection(chatCollections)
          .where('participants', arrayContains: userEmail)
          .orderBy('lastMessageTime', descending: true)
          .get();

      final allChats = query.docs.map((chat) {
        return ChatModel.fromJson(chat);
      }).toList();

      emit(state.copyWith(
        allChats: allChats,
        isLoadingChats: false,
      ));

      return allChats;
    } catch (error) {
      print('Error loading chats: $error');
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoadingChats: false,
      ));
      return [];
    }
  }

  void selectChat(ChatModel chat) {
    emit(state.copyWith(selectedChat: chat, isLoadingMessages: true));

    firestore
        .collection(chatCollections)
        .doc(chat.id)
        .collection(messagesCollection)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      final messages =
          snapshot.docs.map((doc) => MessageModel.fromJson(doc)).toList();

      emit(state.copyWith(
        allMessages: messages,
        isLoadingMessages: false,
      ));
    }, onError: (error) {
      emit(state.copyWith(
        isLoadingMessages: false,
        errorMessage: error.toString(),
      ));
    });
  }

  Future<void> laodAllMessages(String? chatId) => loadAllMessages(chatId);

  /// Load messages for a chatId (top-level messagesCollection)
  Future<void> loadAllMessages(String? chatId) async {
    if (chatId == null || chatId.isEmpty) {
      emit(state.copyWith(
        errorMessage: 'Invalid chatId',
        isLoadingMessages: false,
      ));
      return;
    }

    try {
      emit(state.copyWith(isLoadingMessages: true));
      print("🔍 Loading messages for chatId: $chatId");

      final query = await firestore
          .collection(messagesCollection)
          .where('chatId', isEqualTo: chatId)
          .orderBy('messageTime', descending: true)
          .get();

      final allMessages =
          query.docs.map((d) => MessageModel.fromJson(d)).toList();

      emit(state.copyWith(
        allMessages: allMessages,
        isLoadingMessages: false,
        errorMessage: '',
      ));

      print("✅ Loaded ${allMessages.length} messages for chatId: $chatId");
    } catch (error) {
      print("❌ Error loading messages for chatId $chatId: $error");
      emit(state.copyWith(
        isLoadingMessages: false,
        errorMessage: error.toString(),
      ));
    }
  }

  /// Helper to load by two users — same API you already used on your screen.
  Future<void> loadMessagesBetweenUsers(
      String currentUserId, String otherUserId) async {
    final chatId = generateChatId(currentUserId, otherUserId);
    await loadAllMessages(chatId);
  }

  Future<void> addMessage(
      String currentUserId, String otherUserId, MessageModel model) async {
    try {
      emit(state.copyWith(isLoadingMessages: true, isSendingMessage: true));

      final chatId = generateChatId(currentUserId, otherUserId);
      print("📤 Adding message to chatId: $chatId");

      final docRef = firestore.collection(messagesCollection).doc();
      final uniqueId = docRef.id;
      final messageWithId = model.copyWith(id: uniqueId, chatId: chatId);
      final Map<String, dynamic> messageData = messageWithId.toJson();

      await docRef.set(messageData);

      final List<MessageModel> updatedMessages = [
        messageWithId,
        ...state.allMessages
      ];

      emit(state.copyWith(
        isLoadingMessages: false,
        allMessages: updatedMessages,
        isSendingMessage: false,
      ));

      print(
          "✅ Message added successfully with ID: $uniqueId to chatId: $chatId");
    } catch (error) {
      print("❌ Failed to send message: ${error.toString()}");
      emit(state.copyWith(
        isSendingMessage: false,
        isLoadingMessages: false,
        errorMessage: error.toString(),
      ));
    }
  }

  /// Delete all messages in this conversation
  Future<void> deleteAllMessages(
      String currentUserId, String otherUserId) async {
    try {
      emit(state.copyWith(isLoadingMessages: true));
      final chatId = generateChatId(currentUserId, otherUserId);
      print("🗑 Deleting all messages for chatId: $chatId");

      final query = await firestore
          .collection(messagesCollection)
          .where('chatId', isEqualTo: chatId)
          .get();

      if (query.docs.isEmpty) {
        print("ℹ No messages found for chatId $chatId");
        emit(state.copyWith(
          isLoadingMessages: false,
          errorMessage: "No messages found to delete",
        ));
        return;
      }

      final batch = firestore.batch();
      for (final d in query.docs) {
        batch.delete(d.reference);
      }
      await batch.commit();

      emit(state.copyWith(
          allMessages: [], isLoadingMessages: false, errorMessage: ''));

      print("✅ Deleted ${query.docs.length} messages for chatId: $chatId");
    } catch (error) {
      print("❌ Failed to delete messages: $error");
      emit(state.copyWith(
        isLoadingMessages: false,
        errorMessage: error.toString(),
      ));
    }
  }
}

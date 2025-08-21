// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_chat/features/chats/model/message_model.dart';
import 'package:smile_chat/utils/constant.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(const MessageState());
  final fireStore = FirebaseFirestore.instance;

  String generateChatId(String userId1, String userId2) {
    final List<String> users = [userId1, userId2]..sort();
    return users.join('_');
  }

  Future<void> laodAllMessages(String? chatId) async {
    try {
      emit(state.copyWith(isLoading: true));
      print("🔍 Loading messages for chatId: $chatId");
      final query = await fireStore
          .collection(messagesCollection)
          .where('chatId', isEqualTo: chatId)
          .orderBy('messageTime', descending: true)
          .get();

      final allMessages =
          query.docs.map((message) => MessageModel.fromJson(message)).toList();
      emit(state.copyWith(
        allMessages: allMessages,
        isLoading: false,
      ));
      print(
          "✅ Successfully loaded ${allMessages.length} messages for chatId: $chatId");
    } catch (error) {
      print("❌ Error loading messages for chatId $chatId: ${error.toString()}");
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  Future<void> loadMessagesBetweenUsers(
      String currentUserId, String otherUserId) async {
    final chatId = generateChatId(currentUserId, otherUserId);
    await laodAllMessages(chatId);
  }

  Future<void> addMessage(
      String currentUserId, String otherUserId, MessageModel model) async {
    try {
      emit(state.copyWith(isLoading: true, isSending: true));

      final chatId = generateChatId(currentUserId, otherUserId);
      print("📤 Adding message to chatId: $chatId");

      final docRef = fireStore.collection(messagesCollection).doc();
      final uniqueId = docRef.id;
      final messageWithId = model.copyWith(id: uniqueId, chatId: chatId);
      final Map<String, dynamic> messageData = messageWithId.toJson();

      await docRef.set(messageData);

      final List<MessageModel> updatedMessages = [
        messageWithId,
        ...state.allMessages
      ];

      emit(state.copyWith(
        isLoading: false,
        allMessages: updatedMessages,
        isSending: false,
      ));

      print(
          "✅ Message added successfully with ID: $uniqueId to chatId: $chatId");
    } catch (error) {
      print("❌ Failed to send message: ${error.toString()}");
      emit(state.copyWith(
        isLoading: false,
        isSending: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> deleteAllMessages(
      String currentUserId, String otherUserId) async {
    try {
      emit(state.copyWith(isLoading: true));
      final chatId = generateChatId(currentUserId, otherUserId);

      print("🗑️ Deleting all messages for chatId: $chatId");

      final query = await fireStore
          .collection(messagesCollection)
          .where('chatId', isEqualTo: chatId)
          .get();

      if (query.docs.isEmpty) {
        print("ℹ️ No messages found to delete for chatId: $chatId");
        emit(state.copyWith(
          isLoading: false,
          errorMessage: "No messages found to delete",
        ));
        return;
      }
      final WriteBatch batch = fireStore.batch();
      for (QueryDocumentSnapshot queryDocumentSnapshot in query.docs) {
        batch.delete(queryDocumentSnapshot.reference);
      }
      await batch.commit();
      emit(state.copyWith(
        allMessages: [],
        isLoading: false,
      ));

      print(
          "✅ Successfully deleted ${query.docs.length} messages for chatId: $chatId");
    } catch (error) {
      print("❌ Failed to delete messages: ${error.toString()}");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }
}

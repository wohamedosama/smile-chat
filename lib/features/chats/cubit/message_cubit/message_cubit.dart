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

  Future<void> laodAllMessages(String? userId) async {
    try {
      emit(state.copyWith(
        isLoading: true,
      ));
      final query = await fireStore
          .collection(messagesCollection)
          .where('orderId', isEqualTo: userId)
          .orderBy('messageTime', descending: true)
          .get();

      final allMessages =
          query.docs.map((message) => MessageModel.fromJson(message)).toList();
      emit(state.copyWith(
        allMessages: allMessages,
        isLoading: false,
      ));
      print("Successfully loaded ${allMessages.length} messages");
    } catch (error) {
      print(
          "There is a problem while you loading all messages ${error.toString()}");
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  Future<void> addMessage(String? userId, MessageModel model) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        isSending: true,
      ));

      final Map<String, dynamic> messageData = model.toJson();
      final query =
          await fireStore.collection(messagesCollection).add(messageData);
      final MessageModel updatedMessage = model.copyWith(id: query.id);
      final List<MessageModel> updatedMessages = [
        updatedMessage,
        ...state.allMessages
      ];
      emit(state.copyWith(
        isLoading: false,
        allMessages: updatedMessages,
        isSending: false,
      ));
      print("Message added successfully with ID: ${query.id}");
    } catch (error) {
      print("Failed to send message: ${error.toString()}");
      emit(state.copyWith(
        isLoading: false,
        isSending: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> deleteAllMessages(String? userId) async {
    try {
      emit(state.copyWith(isLoading: true));
      final query = await fireStore
          .collection(messagesCollection)
          .where('userId', isEqualTo: userId)
          .get();
      if (query.docs.isEmpty) {
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
      print("Successfully deleted ${query.docs.length} messages");
    } catch (error) {
      print("Failed to delete messages: ${error.toString()}");
      emit(state.copyWith(errorMessage: error.toString()));
    }
  }
}

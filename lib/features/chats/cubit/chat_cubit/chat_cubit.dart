// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/utils/constant.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());
  final firestore = FirebaseFirestore.instance;
  Future<List<ChatModel>> loadAllChats(String? userId) async {
    if (userId == null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'User not authenticated',
      ));
      return [];
    }
    try {
      emit(state.copyWith(isLoading: true));
      final query = await firestore
          .collection(chatCollections)
          .where('userId', isEqualTo: userId)
          .orderBy('lastMessageTime', descending: true)
          .get();

      final allChats = query.docs.map((chat) {
        return ChatModel.fromJson(chat);
      }).toList();
      emit(state.copyWith(
        allChats: allChats,
        isLoading: false,
      ));
      return allChats;
    } catch (error) {
      print('Error loading chats: $error');
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
    return [];
  }

  void selectChat(ChatModel chat) {
    emit(state.copyWith(selectedChat: chat));
  }

  void clearSelectedChat() {
    emit(state.copyWith());
  }

  void clearError() {
    emit(state.copyWith());
  }
}

part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final bool isLoading;
  final List<ChatModel> allChats;
  final String? errorMessage;
  final ChatModel? selectedChat;

  const ChatState({
    this.isLoading = false,
    this.allChats = const [],
    this.errorMessage,
    this.selectedChat,
  });

  @override
  List<Object?> get props => [
        isLoading,
        allChats,
        errorMessage,
        selectedChat,
      ];

  ChatState copyWith({
    bool? isLoading,
    List<ChatModel>? allChats,
    String? errorMessage,
    ChatModel? selectedChat,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      allChats: allChats ?? this.allChats,
      errorMessage: errorMessage,
      selectedChat: selectedChat ?? this.selectedChat,
    );
  }
}

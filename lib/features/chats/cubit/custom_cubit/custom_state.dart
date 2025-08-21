part of 'custom_cubit.dart';

class CustomState extends Equatable {
  final bool isLoadingChats;
  final List<ChatModel> allChats;
  final String? errorMessage;
  final ChatModel? selectedChat;
  final bool isLoadingMessages;
  final bool isSendingMessage;
  final List<MessageModel> allMessages;

  const CustomState({
    this.isLoadingChats = false,
    this.allChats = const [],
    this.errorMessage,
    this.selectedChat,
    this.isLoadingMessages = false,
    this.isSendingMessage = false,
    this.allMessages = const [],
  });
  CustomState copyWith({
    bool? isLoadingChats,
    List<ChatModel>? allChats,
    String? errorMessage,
    ChatModel? selectedChat,
    bool? isLoadingMessages,
    bool? isSendingMessage,
    List<MessageModel>? allMessages,
  }) {
    return CustomState(
      isLoadingChats: isLoadingChats ?? this.isLoadingChats,
      allChats: allChats ?? this.allChats,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedChat: selectedChat ?? this.selectedChat,
      isLoadingMessages: isLoadingMessages ?? this.isLoadingMessages,
      isSendingMessage: isSendingMessage ?? this.isSendingMessage,
      allMessages: allMessages ?? this.allMessages,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingChats,
        allChats,
        errorMessage,
        selectedChat,
        isLoadingMessages,
        isSendingMessage,
        allMessages,
      ];
}

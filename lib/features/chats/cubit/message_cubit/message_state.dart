// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'message_cubit.dart';

class MessageState extends Equatable {
  final List<MessageModel> allMessages;
  final String errorMessage;
  final bool isLoading;
  final bool isSending;
  const MessageState({
    this.isSending = false,
    this.allMessages = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });
  MessageState copyWith({
    List<MessageModel>? allMessages,
    String? errorMessage,
    bool? isLoading,
    bool? isSending,
  }) {
    return MessageState(
      isSending: isLoading ?? this.isSending,
      allMessages: allMessages ?? this.allMessages,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        allMessages,
        errorMessage,
        isLoading,
        isSending,
      ];
}

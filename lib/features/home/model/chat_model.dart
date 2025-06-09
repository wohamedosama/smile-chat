class ChatModel {
  final String id;
  final String name;
  final String? image;
  final String lastMessage;
  final String lastMessageTime;
  final int? unReadMessagsCount;
  final bool? isOnline;
  const ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unReadMessagsCount = 0,
    this.image,
    this.isOnline = false,
  });
}

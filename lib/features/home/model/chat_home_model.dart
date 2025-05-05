class ChatHomeModel {
  final String id;
  final String name;
  final String? image;
  final String lastMessage;
  final String lastMessageTime;
  final double? unReadMessagsCount;
  ChatHomeModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unReadMessagsCount,
    this.image,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String chatId;
  final List<String> participants;
  final String lastMessage;
  final Timestamp lastMessageTime;
  final String? image;
  final String name;
  final int? unReadMessagsCount;
  final bool? isOnline;

  const ChatModel({
    required this.chatId,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.name,
    this.unReadMessagsCount,
    this.image,
    this.isOnline = false,
  });

  factory ChatModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>?;
    if (json == null) {
      throw Exception("Invalid or null chat document");
    }

    return ChatModel(
      chatId: json['chatId'] ?? doc.id,
      image: json['image'],
      name: json['name'] ?? '',
      isOnline: json['isOnline'] ?? false,
      unReadMessagsCount: json['unReadMessagsCount'],
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      lastMessageTime: json['lastMessageTime'] ?? Timestamp.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'image': image,
      'name': name,
      'isOnline': isOnline,
      'unReadMessagsCount': unReadMessagsCount,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime
    };
  }

  ChatModel copyWith(
    String? chatId,
    List<String>? participants,
    String? name,
    String? image,
    bool? isOnline,
    int? unReadMessagsCount,
    String? lastMessage,
    Timestamp? lastMessageTime,
  ) {
    return ChatModel(
      chatId: chatId ?? this.chatId,
      name: name ?? this.name,
      isOnline: isOnline ?? this.isOnline,
      unReadMessagsCount: unReadMessagsCount ?? this.unReadMessagsCount,
      image: image ?? this.image,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  @override
  List<Object?> get props => [
        unReadMessagsCount,
        name,
        isOnline,
        image,
        chatId,
        participants,
        lastMessageTime,
        lastMessage,
      ];
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CustomChatModel extends Equatable {
  final String chatId;
  final List<String> participants;
  final String lastMessage;
  final Timestamp lastMessageTime;

  const CustomChatModel({
    required this.chatId,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory CustomChatModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data as Map<String, dynamic>;
    return CustomChatModel(
      chatId: doc.id,
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      lastMessageTime: json['lastMessageTime'] ?? Timestamp.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime
    };
  }

  CustomChatModel copyWith(
    String? chatId,
    List<String>? participants,
    String? lastMessage,
    Timestamp? lastMessageTime,
  ) {
    return CustomChatModel(
      chatId: chatId ?? this.chatId,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  @override
  List<Object?> get props => [
        chatId,
        participants,
        lastMessageTime,
        lastMessage,
      ];
}

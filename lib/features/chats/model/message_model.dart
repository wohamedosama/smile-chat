import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String id;
  final String chatId;
  final String userId;
  final String message;
  final String name;
  final String image;
  final Timestamp createdAt;
  final Timestamp messageTime;

  const MessageModel({
    required this.id,
    required this.chatId,
    required this.userId,
    required this.message,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.messageTime,
  });

  factory MessageModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    return MessageModel(
      id: doc.id,
      chatId: json['chatId'] ?? '',
      userId: json['userId'] ?? '',
      message: json['message'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['createdAt'] ?? Timestamp.now(),
      messageTime: json['messageTime'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatId': chatId,
      'userId': userId,
      'message': message,
      'name': name,
      'image': image,
      'createdAt': createdAt,
      'messageTime': messageTime,
    };
  }

  MessageModel copyWith({
    String? id,
    String? chatId,
    String? userId,
    String? message,
    String? name,
    String? image,
    Timestamp? createdAt,
    Timestamp? messageTime,
  }) {
    return MessageModel(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      name: name ?? this.name,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      messageTime: messageTime ?? this.messageTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        chatId,
        userId,
        message,
        name,
        image,
        createdAt,
        messageTime,
      ];
}

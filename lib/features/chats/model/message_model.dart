// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String id;
  final String message;
  final Timestamp createdAt;
  final Timestamp messageTime;
  final String image;
  final String name;
  final bool? isOnline;
  const MessageModel({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.messageTime,
    required this.image,
    required this.name,
    this.isOnline,
  });

  factory MessageModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    return MessageModel(
      id: json['id'] ?? doc.id,
      message: json['message'],
      createdAt: json['createdAt'] ?? Timestamp.now(),
      messageTime: json['messageTime'],
      image: json['image'],
      name: json['name'],
      isOnline: json['isOnline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'createdAt': createdAt,
      'messageTime': messageTime,
      'image': image,
      'name': name,
      'isOnline': isOnline,
    };
  }

  MessageModel copyWith({
    String? id,
    String? message,
    Timestamp? createdAt,
    Timestamp? messageTime,
    String? image,
    String? name,
    bool? isOnline,
  }) {
    return MessageModel(
      id: id ?? this.id,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      messageTime: messageTime ?? this.messageTime,
      image: image ?? this.image,
      name: name ?? this.name,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  List<Object?> get props => [
        message,
        createdAt,
        messageTime,
        image,
        name,
        id,
        isOnline,
      ];
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String id;
  final String name;
  final String? image;
  final String lastMessage;
  final Timestamp lastMessageTime;
  final int? unReadMessagsCount;
  final bool? isOnline;
  final String? userId;
  const ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unReadMessagsCount = 0,
    this.image,
    this.isOnline = false,
    this.userId,
  });

  factory ChatModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>?;

    if (json == null) {
      throw Exception("Invalid or null chat document");
    }

    return ChatModel(
      id: json['id'] ?? doc.id,
      name: json['name'] ?? '',
      image: json['image'],
      lastMessage: json['lastMessage'] ?? '',
      lastMessageTime: json['lastMessageTime'] ?? Timestamp.now(),
      unReadMessagsCount: json['unReadMessagsCount'] ?? 0,
      isOnline: json['isOnline'] ?? false,
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'lastMessage': lastMessage,
      'lastMessageTime': Timestamp.fromDate(DateTime.now()),
      'unReadMessagsCount': unReadMessagsCount,
      'isOnline': isOnline,
      'userId': userId,
    };
  }

  ChatModel copyWith({
    String? id,
    String? name,
    String? image,
    String? lastMessage,
    Timestamp? lastMessageTime,
    int? unReadMessagsCount,
    bool? isOnline,
    String? userId,
  }) {
    return ChatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      image: image ?? this.image,
      isOnline: isOnline ?? this.isOnline,
      unReadMessagsCount: unReadMessagsCount ?? this.unReadMessagsCount,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        lastMessage,
        lastMessageTime,
        unReadMessagsCount,
        userId,
        isOnline,
      ];
}

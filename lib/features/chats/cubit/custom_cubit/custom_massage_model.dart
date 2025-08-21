import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CustomMessageModel extends Equatable {
  final String senderId;
  final String text;
  final Timestamp timestamp;
  const CustomMessageModel({
    required this.senderId,
    required this.text,
    required this.timestamp,
  });

  factory CustomMessageModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data as Map<String, dynamic>;
    return CustomMessageModel(
      senderId: json['senderId'],
      text: json['text'],
      timestamp: json['timestamp'] ?? Timestamp.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'text': text,
      'timestamp': timestamp,
    };
  }

  CustomMessageModel copyWith(
    String? senderId,
    String? text,
    Timestamp? timestamp,
  ) {
    return CustomMessageModel(
      senderId: senderId ?? this.senderId,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  List<Object?> get props => [
        senderId,
        text,
        timestamp,
      ];
}

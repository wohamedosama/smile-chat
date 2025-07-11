import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class StoryModel extends Equatable {
  final String storyId;
  final String userId;
  final String name;
  final String userImage;
  final String? imageUrl;
  final String? text;
  final String? backgroundColor;
  final StoryType storyType;
  final DateTime createdAt;
  final DateTime expiredAt;
  final bool isViewed;
  final List<String> viewedBy;
  final Duration duration;

  const StoryModel({
    required this.storyType,
    required this.storyId,
    required this.userId,
    required this.name,
    required this.userImage,
    required this.createdAt,
    required this.expiredAt,
    this.imageUrl,
    this.text,
    this.backgroundColor,
    this.duration = const Duration(seconds: 5),
    this.isViewed = false,
    this.viewedBy = const [],
  });
  factory StoryModel.fromFireStore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return StoryModel(
      storyId: doc.id,
      backgroundColor: data['backgroundColor'],
      duration: data['duration'],
      imageUrl: data['imageUrl'],
      text: data['text'],
      userId: data['userId'],
      name: data['name'],
      userImage: data['userImage'],
      createdAt: data['createdAt'],
      expiredAt: data['expiredAt'],
      isViewed: data['isViewed'] ?? false,
      viewedBy: List<String>.from(data['viewedBy'] ?? []),
      storyType: StoryType.values.firstWhere(
        ((storyType) {
          return storyType.toString() == data['storyType'];
        }),
        orElse: () {
          return StoryType.image;
        },
      ),
    );
  }
  Map<String, dynamic> toFireStore() {
    return {
      "userId": userId,
      "name": name,
      "userImage": userImage,
      "createdAt": Timestamp.fromDate(createdAt),
      "expiredAt": Timestamp.fromDate(expiredAt),
      "viewedBy": viewedBy,
      "storyType": storyType.toString(),
      "backgroundColor": backgroundColor,
      "imageUrl": imageUrl,
      "text": text,
      "duration": duration.inSeconds,
    };
  }

  StoryModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? userImage,
    DateTime? createdAt,
    DateTime? expiredAt,
    bool? isViewed,
    List<String>? viewedBy,
    StoryType? storyType,
    String? imageUrl,
    String? text,
    String? backgroundColor,
    Duration? duration,
  }) {
    return StoryModel(
      storyType: storyType ?? this.storyType,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      storyId: id ?? storyId,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      userImage: userImage ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      expiredAt: expiredAt ?? this.expiredAt,
      isViewed: isViewed ?? this.isViewed,
      viewedBy: viewedBy ?? this.viewedBy,
    );
  }

  @override
  List<Object?> get props => [
        storyId,
        userId,
        name,
        userImage,
        createdAt,
        expiredAt,
        isViewed,
        viewedBy,
        duration,
        imageUrl,
        text,
        backgroundColor,
      ];
}

enum StoryType {
  image,
  text,
  video,
}

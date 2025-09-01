import 'package:flutter/material.dart';
import 'package:smile_chat/features/chats/model/chat_model.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomizeChatImage extends StatelessWidget {
  const CustomizeChatImage({
    super.key,
    required this.model,
  });

  final ChatModel model;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: AppColor.primaryColor,
      child: buildChatImage(
        model.image,
      ),
    );
  }

  Widget buildChatImage(String? image) {
    if (image == null || image.isEmpty) {
      return const Icon(Icons.person);
    }
    if (image.startsWith('http')) {
      return ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person);
          },
        ),
      );
    } else {
      return ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person);
          },
        ),
      );
    }
  }
}

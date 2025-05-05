import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
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
      child: Image.asset(
        model.image!,
        fit: BoxFit.contain,
      ),
    );
  }
}

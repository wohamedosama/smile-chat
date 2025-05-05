import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_count_of_unread_messages.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class UnreadMessagesAndTimeOfTheChat extends StatelessWidget {
  const UnreadMessagesAndTimeOfTheChat({super.key, required this.model});

  final ChatModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          model.lastMessageTime,
          style: AppStyles.styleExtraBold12,
        ),
        const SizedBox(height: 12),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const SizedBox(height: 20), // space for badge
            CustomCountOfUnreadMessage(model: model),
          ],
        ),
        // const SizedBox(height: 4),
      ],
    );
  }
}

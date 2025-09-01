import 'package:flutter/material.dart';
import 'package:smile_chat/features/chats/model/chat_model.dart';
import 'package:smile_chat/features/home/time_formatter.dart';
import 'package:smile_chat/utils/app_color.dart';

class UnreadMessagesAndTimeOfTheChat extends StatelessWidget {
  const UnreadMessagesAndTimeOfTheChat({super.key, required this.model});

  final ChatModel model;

  @override
  Widget build(BuildContext context) {
    final bool hasUnreadMessages = (model.unReadMessagsCount ?? 0) > 0;
    final String formattedTime =
        TimeFormatter.formatChatTime(model.lastMessageTime);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 12,
            color: hasUnreadMessages ? AppColor.primaryColor : Colors.grey[600],
            fontWeight: hasUnreadMessages ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        if (hasUnreadMessages)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Text(
              model.unReadMessagsCount! > 99
                  ? '+99'
                  : '${model.unReadMessagsCount}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

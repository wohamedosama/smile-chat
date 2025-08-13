import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/features/chats/presentation/widget/receiver_item.dart';
import 'package:smile_chat/features/chats/presentation/widget/sender_item.dart';

class ChatBubbleItem extends StatelessWidget {
  const ChatBubbleItem({
    super.key,
    required this.now,
    required this.formatter,
    required this.receiverText,
    required this.senderText,
  });

  final DateTime now;
  final DateFormat formatter;
  final String receiverText;
  final String senderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SenderItem(
          now: now,
          formatter: formatter,
          senderText: senderText,
        ),
        ReceiverItem(
          now: now,
          formatter: formatter,
          receiverText: receiverText,
        ),
      ],
    );
  }
}

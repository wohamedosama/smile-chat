import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/features/chats/presentation/screens/chats_screen.dart';
import 'package:smile_chat/features/chats/presentation/widget/receiver_item.dart';
import 'package:smile_chat/features/chats/presentation/widget/sender_item.dart';

class ChatBubbleItem extends StatelessWidget {
  const ChatBubbleItem({
    super.key,
    required this.now,
    required this.formatter,
  });

  final DateTime now;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SenderItem(now: now, formatter: formatter),
        ReceiverItem(now: now, formatter: formatter),
      ],
    );
  }
}

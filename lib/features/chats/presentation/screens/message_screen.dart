// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/features/chats/presentation/widget/chat_app_bar.dart';
import 'package:smile_chat/features/chats/presentation/widget/chat_bubble_item.dart';
import 'package:smile_chat/features/chats/presentation/widget/custom_message_bar.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/utils/app_color.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm a');
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatsAppBar(chatModel: chatModel),
              const SizedBox(height: 60),
              DateChip(
                date: DateTime(now.year, now.month, now.day - 1),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) => ChatBubbleItem(
                      now: now, formatter: formatter, chatModel: chatModel),
                ),
              ),
              CustomMessageBar(
                messageController: TextEditingController(),
                onSend: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

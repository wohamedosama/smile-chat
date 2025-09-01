// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/features/chats/cubit/chat_cubit/chat_cubit.dart';
import 'package:smile_chat/features/chats/model/chat_model.dart';
import 'package:smile_chat/features/chats/model/message_model.dart';
import 'package:smile_chat/features/chats/presentation/widget/chat_app_bar.dart';
import 'package:smile_chat/features/chats/presentation/widget/chat_bubble_item.dart';
import 'package:smile_chat/features/chats/presentation/widget/custom_message_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late String chatId;
  late String otherUserId;

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<ChatCubit>(context);

    otherUserId = widget.chatModel.chatId;
    chatId = cubit.generateChatId(userId!, otherUserId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(
          "🚀 Loading messages for chat: ${widget.chatModel.name} with chatId: $chatId");
      print("🔍 Current user: $userId, Other user: $otherUserId");
      cubit.listenToMessages(userId!, chatId);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void handleMessage() {
    final messageText = controller.text.trim();
    if (messageText.isEmpty) return;
    final now = DateTime.now();

    final message = MessageModel(
      chatId: chatId,
      userId: userId!,
      id: '',
      message: messageText,
      createdAt: Timestamp.fromDate(now),
      messageTime: Timestamp.fromDate(now),
      image: '',
      name: '',
    );
    BlocProvider.of<ChatCubit>(context)
        .addMessage(userId!, otherUserId, message);

    controller.clear();
    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('hh:mm a');

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ChatsAppBar(chatModel: widget.chatModel),
                  const SizedBox(height: 60),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: state.allMessages.length,
                      itemBuilder: (context, index) {
                        final message = state.allMessages[index];
                        final isCurrentUser = message.userId == userId;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ChatBubbleItem(
                            isCurrentUser: isCurrentUser,
                            senderText: isCurrentUser ? message.message : '',
                            receiverText: !isCurrentUser ? message.message : '',
                            now: message.messageTime.toDate(),
                            formatter: formatter,
                          ),
                        );
                      },
                    ),
                  ),
                  CustomMessageBar(
                    isTyping: true,
                    messageController: controller,
                    onSend: handleMessage,
                    onSubmitted: (value) {
                      handleMessage();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_circle_progress_indicator.dart';
import 'package:smile_chat/features/chats/cubit/message_cubit/message_cubit.dart';
import 'package:smile_chat/features/chats/model/message_model.dart';
import 'package:smile_chat/features/chats/presentation/widget/chat_app_bar.dart';
import 'package:smile_chat/features/chats/presentation/widget/chat_bubble_item.dart';
import 'package:smile_chat/features/chats/presentation/widget/custom_message_bar.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

final TextEditingController controller = TextEditingController();

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (userId != null) {
        BlocProvider.of<MessageCubit>(context).laodAllMessages(userId);
      } else {
        // ignore: avoid_print
        print('⚠️ No user logged in, cannot load chats');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm a');
    final documentStream =
        FirebaseFirestore.instance.collection(messagesCollection).snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: documentStream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: AppColor.whiteColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: BlocBuilder<MessageCubit, MessageState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ChatsAppBar(chatModel: widget.chatModel),
                        const SizedBox(height: 60),
                        DateChip(
                          date: DateTime(now.year, now.month, now.day - 1),
                        ),
                        state.isLoading
                            ? const Center(
                                child: CustomCircleProgressIndicator(),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: state.allMessages.length,
                                  itemBuilder: (context, index) =>
                                      ChatBubbleItem(
                                    senderText: controller.text,
                                    receiverText: 'Hello Mohamed Osama ',
                                    now: now,
                                    formatter: formatter,
                                  ),
                                ),
                              ),
                        CustomMessageBar(
                          isTyping: true,
                          messageController: controller,
                          onSend: () {
                            BlocProvider.of<MessageCubit>(context).addMessage(
                              userId,
                              MessageModel(
                                id: userId!,
                                message: controller.text,
                                isOnline: true,
                                createdAt: Timestamp.fromDate(now),
                                messageTime: Timestamp.fromDate(now),
                                image: widget.chatModel.image!,
                                name: widget.chatModel.name,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}

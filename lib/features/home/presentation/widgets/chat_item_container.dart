import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_circle_progress_indicator.dart';
import 'package:smile_chat/features/chats/cubit/chat_cubit/chat_cubit.dart';
import 'package:smile_chat/features/home/presentation/widgets/all_chat_empty_widget.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item.dart';
import 'package:smile_chat/features/home/presentation/widgets/customize_meterial_indicator_widget.dart';
import 'package:smile_chat/features/home/presentation/widgets/error_loading_chats_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class ChatItemContainer extends StatelessWidget {
  const ChatItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final documentStream =
        FirebaseFirestore.instance.collection(chatCollections).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: documentStream,
      builder: (context, snapshot) {
        return BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state.isLoadingChats == true) {
              return const Center(
                child:
                    CustomCircleProgressIndicator(color: AppColor.whiteColor),
              );
            }
            if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
              return ErrorLoadingChatWidget(
                errorMessage: state.errorMessage!,
                onPressed: () =>
                    BlocProvider.of<ChatCubit>(context).loadAllChats(userId!),
              );
            }
            if (state.allChats.isEmpty) {
              return const AllChatEmptyWidget();
            }
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: AppColor.whiteColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomizeMeterialIndicator(
                        onRefresh: () async {
                          BlocProvider.of<ChatCubit>(context)
                              .loadAllChats(userId!);
                        },
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final chat = state.allChats[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(messageScreen, arguments: chat);
                              },
                              child: ChatItem(model: chat),
                            );
                          },
                          itemCount: state.allChats.length,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

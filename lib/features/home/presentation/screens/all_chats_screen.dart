// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/chats/cubit/chat_cubit/chat_cubit.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item_container.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({super.key});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (userId != null) {
        BlocProvider.of<ChatCubit>(context)
            .loadAllChats('mohamedmedo9932@gmail.com');
      } else {
        print('⚠️ No user logged in, cannot load chats');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CustomHomeScreenAppBar(
                  onTapProfileImage: () =>
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(profileScreen),
                  onPressed: () {
                    final chatCubit = context.read<ChatCubit>();
                    Navigator.of(context, rootNavigator: true).pushNamed(
                        searchScreen,
                        arguments: chatCubit.state.allChats);
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Expanded(child: ChatItemContainer()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item_container.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/stories_list_view.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomHomeScreenAppBar(
                onPressed: () => Navigator.pushNamed(context, searchScreen)),
            const SizedBox(height: 24),
            const StoriesListView(),
            const SizedBox(height: 20),
            const ChatItemContainer(),
          ],
        ),
      ),
    );
  }
}

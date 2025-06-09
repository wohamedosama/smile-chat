import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item_container.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/stories_list_view.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomNavBar(),
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
                    onPressed: () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(searchScreen)),
                const SizedBox(height: 24),
                const StoriesListView(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const ChatItemContainer(),
        ],
      ),
    );
  }
}

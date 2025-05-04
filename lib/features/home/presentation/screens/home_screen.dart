import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Column(
          children: [
            SizedBox(height: 40),
            CustomHomeScreenAppBar(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class StoriesListView extends StatelessWidget {
  const StoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row();
  }
}

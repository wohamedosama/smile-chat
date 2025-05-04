import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

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
            SizedBox(height: 24),
            StoriesListView(),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Row(
              children: [
                StoryItem(),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 18);
          },
          itemCount: 10),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.whiteColor),
          ),
          child: CircleAvatar(
            radius: 26,
            child: Image.asset(Assets.assetsImagesPhoneAuthImage),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'name',
          style: AppStyles.styleRegular14,
        )
      ],
    );
  }
}

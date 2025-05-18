import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_images.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryViewScreen extends StatelessWidget {
  StoryViewScreen({super.key});
  final StoryController storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    return StoryView(
      onComplete: () {},
      indicatorColor: AppColor.whiteColor,
      indicatorForegroundColor: AppColor.midGrayColor,
      storyItems: [
        StoryItem.pageProviderImage(
            caption: 'Mhmt Osama',
            const AssetImage(Assets.assetsImagesStoryImage)),
        StoryItem.text(
            title: 'Mohamed Osama ', backgroundColor: AppColor.blackColor),
        StoryItem.pageProviderImage(
            caption: 'Mhmt Osama ', const AssetImage(Assets.assetsImagesLogo)),
        StoryItem.pageProviderImage(
            caption: 'Mhmt Osama ',
            const AssetImage(Assets.assetsImagesStoryImage)),
        StoryItem.pageProviderImage(
            caption: 'Mhmt Osama ',
            const AssetImage(Assets.assetsImagesStoryImage)),
        StoryItem.pageProviderImage(
            caption: 'Mhmt Osama ',
            const AssetImage(Assets.assetsImagesStoryImage))
      ],
      controller: storyController,
    );
  }
}

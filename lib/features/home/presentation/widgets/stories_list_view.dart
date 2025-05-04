import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/story_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/story_item.dart';
import 'package:smile_chat/utils/app_images.dart';

class StoriesListView extends StatelessWidget {
  const StoriesListView({super.key});
  final List<StoryModel> users = const [
    StoryModel(name: 'My status', image: Assets.assetsImagesPerson1),
    StoryModel(name: 'Adil', image: Assets.assetsImagesPerson2),
    StoryModel(name: 'Marina', image: Assets.assetsImagesPerson3),
    StoryModel(name: 'Dean', image: Assets.assetsImagesPerson4),
    StoryModel(name: 'Max', image: Assets.assetsImagesPerson5),
    StoryModel(name: 'osos', image: Assets.assetsImagesPerson1),
    StoryModel(name: 'Adil', image: Assets.assetsImagesPerson2),
    StoryModel(name: 'Marina', image: Assets.assetsImagesPerson3),
    StoryModel(name: 'Dean', image: Assets.assetsImagesPerson4),
    StoryModel(name: 'Max', image: Assets.assetsImagesPerson5),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              StoryItem(user: users[index]),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 18);
        },
        itemCount: users.length,
      ),
    );
  }
}

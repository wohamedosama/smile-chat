import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/story_model.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.user, this.onTapViewSotry});
  final StatusModel user;
  final void Function()? onTapViewSotry;
  @override
  Widget build(BuildContext context) {
    final bool isMyStatus = user.name == "My status";
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: onTapViewSotry,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isMyStatus
                        ? AppColor.whiteColor.withAlpha(25)
                        : const Color.fromARGB(255, 206, 161, 15),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 26,
                  child: Image.asset(user.image),
                ),
              ),
            ),
            if (isMyStatus)
              Positioned(
                bottom: -4,
                right: -4,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.primaryColor, width: 2),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 16,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          user.name,
          style: AppStyles.styleRegular14.copyWith(color: AppColor.whiteColor),
        )
      ],
    );
  }
}

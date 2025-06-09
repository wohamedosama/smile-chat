import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_png_image.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class LogedInUserInTheProfileScreen extends StatelessWidget {
  const LogedInUserInTheProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
          radius: 30,
          child:
              CustomPNGImage(height: 60, imagePath: Assets.assetsImagesPerson)),
      title: Text(
        "Mohamed Osama",
        style: AppStyles.styleBold20.copyWith(color: AppColor.darkerBlackColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        "Hello Every one with you mohmed osama Flutter developer",
        style:
            AppStyles.styleExtraBold16.copyWith(color: AppColor.midGrayColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

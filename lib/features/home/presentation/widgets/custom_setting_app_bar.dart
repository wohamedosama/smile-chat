import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class CustomSettingAppBar extends StatelessWidget {
  const CustomSettingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomSVGImage(
              imagePath: Assets.assetsImagesArrowBackIcon,
              fit: BoxFit.cover,
              height: 45),
        ),
        const SizedBox(width: 20),
        Text(
          'Settings',
          style: AppStyles.styleBold20.copyWith(color: AppColor.whiteColor),
        ),
      ],
    );
  }
}

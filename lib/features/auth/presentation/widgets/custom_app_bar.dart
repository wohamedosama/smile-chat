import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_SVG_image.dart';
import 'package:smile_chat/utils/app_images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CustomSVGImage(
                imagePath: Assets.assetsImagesArrowBackIcon,
                fit: BoxFit.cover,
                height: 50)),
        Spacer(),
        SizedBox(
            height: 60,
            width: 60,
            child: CustomSVGImage(
              imagePath: Assets.assetsImagesLogo,
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_SVG_image.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_png_image.dart';
import 'package:smile_chat/utils/app_images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.isThatContainImage,
    this.isTheColorBlack = false,
  });

  final bool isThatContainImage;
  final bool isTheColorBlack;
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
                imagePath: isTheColorBlack
                    ? Assets.assetsImagesBalckArrowBackIcon
                    : Assets.assetsImagesArrowBackIcon,
                fit: BoxFit.cover,
                height: 50)),
        const Spacer(),
        isThatContainImage
            ? const SizedBox(
                height: 60,
                width: 60,
                child: CustomPNGImage(
                  imagePath: Assets.assetsImagesLogo,
                  fit: BoxFit.cover,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

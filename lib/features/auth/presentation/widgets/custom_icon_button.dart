import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/utils/app_images.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.iconSize,
    this.icon,
  });
  final void Function()? onPressed;
  final Widget? icon;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: iconSize,
        onPressed: onPressed,
        icon:
            icon ?? const CustomSVGImage(imagePath: Assets.assetsImagesGoogle));
  }
}

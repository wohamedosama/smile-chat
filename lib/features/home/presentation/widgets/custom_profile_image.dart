import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_images.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    this.onTap,
    this.child,
  });
  final void Function()? onTap;

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 24.5,
        backgroundColor: AppColor.whiteColor.withAlpha(25),
        child: child ??
            ClipOval(
              child: Image.asset(
                Assets.assetsImagesPerson,
                fit: BoxFit.cover,
              ),
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_images.dart';

class LandingIconInTheHomePageAppBar extends StatelessWidget {
  const LandingIconInTheHomePageAppBar({
    super.key,
    this.onPressed,
    this.icon,
  });
  final void Function()? onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 21,
      backgroundColor: AppColor.whiteColor.withAlpha(25),
      child: CustomIconButton(
          onPressed: onPressed,
          icon: icon ?? SvgPicture.asset(Assets.assetsImagesSearch, width: 25)),
    );
  }
}

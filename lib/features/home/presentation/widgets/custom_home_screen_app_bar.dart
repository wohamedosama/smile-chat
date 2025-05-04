import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_profile_image.dart';
import 'package:smile_chat/features/home/presentation/widgets/landing_icon_in_the_home_page_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomHomeScreenAppBar extends StatelessWidget {
  const CustomHomeScreenAppBar({
    this.onPressed,
    super.key,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LandingIconInTheHomePageAppBar(onPressed: onPressed),
        const Spacer(),
        Text(
          'Home',
          style: AppStyles.styleMedium20.copyWith(color: AppColor.whiteColor),
        ),
        const Spacer(flex: 18),
        const CustomProfileImage(),
        const Spacer()
      ],
    );
  }
}

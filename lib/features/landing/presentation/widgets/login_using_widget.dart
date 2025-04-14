import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class LoginUsingWidget extends StatelessWidget {
  const LoginUsingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.assetsImagesLogo,
            height: 200, width: 290, fit: BoxFit.cover),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            'Login using',
            style: AppStyles.styleSemiBoldBlackColor45,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class LoginUsingWidget extends StatefulWidget {
  const LoginUsingWidget({super.key});

  @override
  State<LoginUsingWidget> createState() => _LoginUsingWidgetState();
}

class _LoginUsingWidgetState extends State<LoginUsingWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(Assets.assetsImagesLogo), context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.assetsImagesLogo,
          height: 200,
          width: 290,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            'Login using',
            style: AppStyles.styleSemiBoldBlackColor45,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class WelcomeBackWidgetText extends StatelessWidget {
  const WelcomeBackWidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome back',
                style: AppStyles.styleSemiBoldBlackColor45
                    .copyWith(letterSpacing: 15),
              ),
              TextSpan(
                text: '!',
                style: AppStyles.styleSemiBoldBlackColor45
                    .copyWith(letterSpacing: 15, color: Color(0xff130856)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

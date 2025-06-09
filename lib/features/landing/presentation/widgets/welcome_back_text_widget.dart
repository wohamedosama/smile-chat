import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class WelcomeBackWidgetText extends StatelessWidget {
  const WelcomeBackWidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextModel> model = [
      TextModel(
        text: 'Welcome back',
        style: AppStyles.styleSemiBoldBlackColor45.copyWith(letterSpacing: 15),
      ),
      TextModel(
        text: '!',
        style: AppStyles.styleSemiBoldBlackColor45
            .copyWith(letterSpacing: 15, color: const Color(0xff130856)),
      ),
    ];
    return Column(
      children: [
        RichText(
            text: TextSpan(
                children: model
                    .map((item) => TextSpan(text: item.text, style: item.style))
                    .toList())),
      ],
    );
  }
}

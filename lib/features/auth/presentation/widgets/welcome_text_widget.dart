import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextModel> loginModel = [
      TextModel(
          text: 'Welcome!',
          style: AppStyles.styleExtraBold45.copyWith(letterSpacing: 12)),
    ];

    return Column(
      children: [
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            children: loginModel
                .map((item) => TextSpan(text: item.text, style: item.style))
                .toList(),
          ),
        )
      ],
    );
  }
}

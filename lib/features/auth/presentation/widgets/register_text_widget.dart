import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class RegisterTextWidget extends StatelessWidget {
  const RegisterTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextModel> registerModel = [
      TextModel(
          text: 'Register!',
          style: AppStyles.styleExtraBold45.copyWith(letterSpacing: 12)),
    ];
    return Column(
      children: [
        const SizedBox(height: 5),
        RichText(
            text: TextSpan(
                children: registerModel
                    .map((item) => TextSpan(text: item.text, style: item.style))
                    .toList())),
      ],
    );
  }
}

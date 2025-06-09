import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class YouDidnotReceiveCodeTextWidget extends StatelessWidget {
  const YouDidnotReceiveCodeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextModel> model = [
      TextModel(
          text: 'if you didn’t receive a code?',
          style: AppStyles.styleMediumWithWhiteColor16
              .copyWith(color: const Color(0xffcccccc))),
      TextModel(
          text: ' 00:00', style: AppStyles.styleMediumWithLightBlueColor16),
    ];
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: model
              .map((item) => TextSpan(text: item.text, style: item.style))
              .toList(),
        ),
      ),
    );
  }
}

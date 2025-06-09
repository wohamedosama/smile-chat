import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextModel> model = [
      TextModel(
          text: 'By signing ,you agree to our\n',
          style: AppStyles.styleMediumWithWhiteColor16),
      TextModel(
          text: 'Terms of Service',
          style: AppStyles.styleMediumWithLightBlueColor16),
      TextModel(text: ' &', style: AppStyles.styleMediumWithWhiteColor16),
      TextModel(
          text: ' Privacy', style: AppStyles.styleMediumWithLightBlueColor16),
    ];
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: model.map((item) {
          return TextSpan(text: item.text, style: item.style);
        }).toList()));
  }
}

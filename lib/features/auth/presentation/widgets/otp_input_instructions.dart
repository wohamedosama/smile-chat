import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class OTPInputInstructions extends StatelessWidget {
  OTPInputInstructions({
    super.key,
  });
  final List<TextModel> model = [
    TextModel(
        text: 'Now,Enter 4 Digit OTP we sent to you',
        style: AppStyles.styleMedium19,
        maxLines: 2),
    TextModel(
        text: 'sent to +91 98745 63210',
        style: AppStyles.stylelightWithLightPurbleColor16.copyWith(
          color: const Color(0xffcccccc),
        ),
        maxLines: 2),
    TextModel(
        text: 'Use a different number',
        style: AppStyles.stylelightWithLightPurbleColor16),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 80,
      children: [
        Expanded(
          child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: model.map((item) {
                return Text(
                  item.text,
                  style: item.style,
                );
              }).toList()),
        ),
        //   SizedBox(width: 80),
        const CustomSVGImage(imagePath: Assets.assetsImagesEnterOtpCodeImage)
      ],
    );
  }
}

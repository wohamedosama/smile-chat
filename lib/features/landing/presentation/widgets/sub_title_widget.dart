import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'We have created', style: AppStyles.styleRegular16),
              TextSpan(
                  text: ' Smilechat ',
                  style: AppStyles.styleSemiBold16
                      .copyWith(color: Color(0xff130856))),
              TextSpan(
                  text:
                      'App with two different login.User can  prefer the way to login',
                  style: AppStyles.styleRegular16),
            ],
          ),
        ),
      ],
    );
  }
}

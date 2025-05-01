import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class LoginTextChild extends StatelessWidget {
  const LoginTextChild({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        text,
        style: AppStyles.styleExtraBold16.copyWith(color: AppColor.blackColor),
      ),
    );
  }
}

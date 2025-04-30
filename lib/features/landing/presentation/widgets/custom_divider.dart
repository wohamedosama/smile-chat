import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.text = 'OR',
    this.color = AppColor.primaryColor,
    this.style,
  });
  final Color color;
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 1.5,
            color: const Color(0xffCDD1D0),
          ),
        ),
        Text(text,
            style: style ?? AppStyles.styleRegular14.copyWith(color: color)),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 1.5,
            color: const Color(0xffCDD1D0),
          ),
        ),
      ],
    );
  }
}

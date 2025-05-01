import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.style,
  });
  final void Function()? onPressed;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: style ?? AppStyles.styleRegular14),
    );
  }
}

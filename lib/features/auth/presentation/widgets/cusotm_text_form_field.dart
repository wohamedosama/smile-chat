import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.labelText,
    this.labelStyle,
    this.textFormFieldStyle,
    this.cursorColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
  });
  final String labelText;
  final TextStyle? labelStyle;
  final TextStyle? textFormFieldStyle;
  final Color? cursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textFormFieldStyle ?? AppStyles.styleRegularWithWhiteColor16,
      cursorColor: AppColor.whiteColor,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.styleRegularWithWhiteColor16,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: enabledBorderColor ?? AppColor.speicalGray,
              strokeAlign: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: focusedBorderColor ?? AppColor.whiteColor, strokeAlign: 2),
        ),
      ),
    );
  }
}

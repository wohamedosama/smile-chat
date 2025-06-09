import 'package:flutter/material.dart';


class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.textModel,
  });

  final TextModel textModel;
  @override
  Widget build(BuildContext context) {
    return Text(textModel.text, style: textModel.style);
  }
}

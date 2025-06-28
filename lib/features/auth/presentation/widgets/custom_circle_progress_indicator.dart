import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({
    super.key,
    this.color = AppColor.deepPurbleColor,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}

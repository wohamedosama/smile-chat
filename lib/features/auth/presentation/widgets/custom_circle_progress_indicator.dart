import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: CircularProgressIndicator(
        color: AppColor.deepPurbleColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class CustomizeButtonToLogin extends StatelessWidget {
  const CustomizeButtonToLogin({
    this.child,
    super.key,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, homeScreen),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: child,
    );
  }
}

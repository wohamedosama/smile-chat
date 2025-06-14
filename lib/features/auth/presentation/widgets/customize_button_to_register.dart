import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class CustomizeButtonToRegister extends StatelessWidget {
  const CustomizeButtonToRegister({
    this.child,
    super.key,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, loginUsingEmail, (route) => false),
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

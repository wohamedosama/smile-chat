import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomizeButtonToLogin extends StatelessWidget {
  const CustomizeButtonToLogin({
    this.child,
    super.key,
    this.clickToNavigateToHomeScreen,
  });
  final Widget? child;
  final void Function()? clickToNavigateToHomeScreen;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clickToNavigateToHomeScreen,
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

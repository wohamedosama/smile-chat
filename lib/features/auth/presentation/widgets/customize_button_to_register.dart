import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomizeButtonToRegister extends StatelessWidget {
  const CustomizeButtonToRegister({
    this.child,
    super.key,
    this.onPressedRegisterButton,
  });
  final Widget? child;
  final void Function()? onPressedRegisterButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedRegisterButton,
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

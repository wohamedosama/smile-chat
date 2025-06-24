import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_button.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({
    super.key,
    this.pressToNavigateToForgetPasswordScreen,
  });
  final void Function()? pressToNavigateToForgetPasswordScreen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: 'Forgot password?',
          onPressed: pressToNavigateToForgetPasswordScreen,
        ),
      ],
    );
  }
}

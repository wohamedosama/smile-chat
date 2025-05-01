import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_button.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(text: 'Forgot password?'),
      ],
    );
  }
}

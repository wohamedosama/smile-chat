import 'package:flutter/material.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/features/landing/presentation/widgets/or_divider.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(onPressed: () {}, text: 'Mobile number'),
        CustomDivider(),
        CustomElevatedButton(onPressed: () {}, text: 'Email id'),
        SizedBox(height: 47),
      ],
    );
  }
}

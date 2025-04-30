import 'package:flutter/material.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_divider.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/constant.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, loginUsingMobileNumber),
            text: 'Mobile number'),
        const CustomDivider(),
        CustomElevatedButton(
            onPressed: () => Navigator.pushNamed(context, loginUsingEmail),
            text: 'Email id'),
        const SizedBox(height: 47),
      ],
    );
  }
}

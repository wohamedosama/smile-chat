import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/auth_toggle_prompt.dart';
import 'package:smile_chat/features/auth/presentation/widgets/customize_button_to_login.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_text_child.dart';

class LoginButtonAndCreateUserTextButton extends StatelessWidget {
  const LoginButtonAndCreateUserTextButton({
    this.onPressedRegisterButton,
    super.key,
    required this.text,
    required this.customTextButtonText,
    required this.customTextwidgetText,
  });

  final void Function()? onPressedRegisterButton;
  final String text;
  final String customTextButtonText;
  final String customTextwidgetText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomizeButtonToLogin(child: LoginTextChild(text: text)),
        AuthTogglePrompt(
          customTextButtonText: customTextButtonText,
          customTextwidgetText: customTextwidgetText,
          pressToNaviagateToRegisterScreen: onPressedRegisterButton,
        ),
      ],
    );
  }
}

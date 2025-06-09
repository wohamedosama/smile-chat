import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/auth_toggle_prompt.dart';
import 'package:smile_chat/features/auth/presentation/widgets/customize_button_to_register.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_button_and_create_user_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_text_child.dart';
import 'package:smile_chat/utils/app_color.dart';

class CreateAnAccountAndAlreadyAUserTextButton extends StatelessWidget {
  const CreateAnAccountAndAlreadyAUserTextButton({
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
        CustomizeButtonToRegister(child: LoginTextChild(text: text)),
        AuthTogglePrompt(
          customTextButtonText: customTextButtonText,
          customTextwidgetText: customTextwidgetText,
          onPressed: onPressedRegisterButton,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/create_user_text_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_text_child.dart';
import 'package:smile_chat/utils/app_color.dart';

class LoginButtonAndCreateUserTextButton extends StatelessWidget {
  const LoginButtonAndCreateUserTextButton({
    this.onPressedRegisterButton,
    super.key,
    required this.text,
  });

  final void Function()? onPressedRegisterButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomizeButtonToLogin(child: LoginTextChild(text: text)),
        CreateUserTextWidget(onPressed: onPressedRegisterButton),
      ],
    );
  }
}

class CustomizeButtonToLogin extends StatelessWidget {
  const CustomizeButtonToLogin({
    this.child,
    super.key,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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

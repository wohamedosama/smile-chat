import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_button_and_create_user_text_button.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_divider.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/constant.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: AppColor.deepPurbleColor,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(onPressed: () {}),
                const SizedBox(height: 40),
                CustomDivider(style: AppStyles.styleExtraBold16),
                const SizedBox(height: 40),
                const CustomTextFromField(labelText: 'Your email'),
                const SizedBox(height: 40),
                const CustomTextFromField(labelText: 'Password'),
                const SizedBox(height: 14),
                const ForgetPasswordTextButton(),
                const SizedBox(height: 50),
                LoginButtonAndCreateUserTextButton(
                  text: 'Log In',
                  onPressedRegisterButton: () {
                    Navigator.pushNamed(context, registerScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_column_contain_of_custom_text_form_filed_in_the_register_screen.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_button_and_create_user_text_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({super.key});

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
                const SizedBox(height: 14),
                const CustomColumnContainOfCustomTextFormFieldInTheRegisterScreen(),
                const SizedBox(height: 50),
                LoginButtonAndCreateUserTextButton(
                  customTextButtonText: 'Sign in',
                  customTextwidgetText: 'Already a user ?',
                  text: 'Create an account',
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

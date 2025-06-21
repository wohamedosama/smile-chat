import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';

class CustomColumnContainOfCustomTextFormFieldInTheRegisterScreen
    extends StatelessWidget {
  const CustomColumnContainOfCustomTextFormFieldInTheRegisterScreen({
    this.emailController,
    this.passwordController,
    super.key,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 40,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomTextFromField(
          labelText: 'Your Name',
        ),
        CustomTextFromField(
          labelText: 'Your email',
          controller: emailController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
        CustomTextFromField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            } else if (value.length < 6) {
              return 'Password should be at least 6 characters';
            }
            return null;
          },
          labelText: 'Password',
          controller: passwordController,
        ),
        const CustomTextFromField(labelText: 'Confirm Password'),
      ],
    );
  }
}

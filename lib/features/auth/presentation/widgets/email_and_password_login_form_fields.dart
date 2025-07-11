import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';

class EmailAndPasswordLoginFormFields extends StatelessWidget {
  const EmailAndPasswordLoginFormFields({
    super.key,
    required this.email,
    required this.password,
    this.onPasswordFieldSubmitted,
  });
  final TextEditingController email;
  final TextEditingController password;
  final void Function(String)? onPasswordFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                .hasMatch(value.trim())) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          labelText: 'Your email',
          controller: email,
        ),
        const SizedBox(height: 40),
        CustomTextFromField(
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            } else if (value.length < 6) {
              return 'Password should be at least 6 characters';
            }
            return null;
          },
          labelText: 'Password',
          controller: password,
          onFieldSubmitted: onPasswordFieldSubmitted,
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}

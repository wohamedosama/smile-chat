import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';

class RegisterFromFields extends StatelessWidget {
  const RegisterFromFields({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final TextEditingController userName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 40,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFromField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name is required';
            } else if (value.trim().length < 2) {
              return 'Name must be at least 2 characters';
            } else if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value.trim())) {
              return 'Name can only contain letters, numbers, underscore, or hyphen';
            }
            return null;
          },
          labelText: 'Your Name',
          controller: userName,
        ),
        CustomTextFromField(
          labelText: 'Your email',
          controller: email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                .hasMatch(value.trim())) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
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
        ),
        CustomTextFromField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm Password is required';
              }
              if (value != password.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            controller: confirmPassword,
            isPassword: true,
            labelText: 'Confirm Password'),
      ],
    );
  }
}

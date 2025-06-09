import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';

class CustomColumnContainOfCustomTextFormFieldInTheRegisterScreen
    extends StatelessWidget {
  const CustomColumnContainOfCustomTextFormFieldInTheRegisterScreen(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 40,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFromField(labelText: 'Your Name'),
        CustomTextFromField(labelText: 'Your email'),
        CustomTextFromField(labelText: 'Password'),
        CustomTextFromField(labelText: 'Confirm Password'),
      ],
    );
  }
}

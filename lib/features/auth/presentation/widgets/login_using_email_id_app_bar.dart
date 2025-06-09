import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/register_text_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/welcome_text_widget.dart';

class CustomizeAutAppBar extends StatelessWidget {
  const CustomizeAutAppBar({
    super.key,
    required this.isLoginPage,
  });
  final bool isLoginPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const CustomAppBar(isThatContainImage: true, isTheColorBlack: true),
          isLoginPage ? const WelcomeTextWidget() : const RegisterTextWidget(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

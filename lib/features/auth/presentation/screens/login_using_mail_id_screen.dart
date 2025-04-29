import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/welcome_back_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';

class LoginUsingMailIdScreen extends StatelessWidget {
  const LoginUsingMailIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CustomAppBar(isThatContainImage: true, isTheColorBlack: true),
            WelcomeTextWidget(),
          ],
        ),
      ),
    );
  }
}

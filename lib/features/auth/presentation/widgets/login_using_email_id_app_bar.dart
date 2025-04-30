import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/welcome_text_widget.dart';

class LoginUsingMailIdAppBar extends StatelessWidget {
  const LoginUsingMailIdAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          CustomAppBar(isThatContainImage: true, isTheColorBlack: true),
          WelcomeTextWidget(),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

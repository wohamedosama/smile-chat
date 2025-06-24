import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_container.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_using_email_id_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';

class LoginUsingMailIdScreen extends StatelessWidget {
  const LoginUsingMailIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomizeAutAppBar(isLoginPage: true),
          LoginContainer()
        ],
      ),
    );
  }
}

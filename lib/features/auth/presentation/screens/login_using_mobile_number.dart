import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

class LoginUsingMobileNumber extends StatelessWidget {
  const LoginUsingMobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.lightBlueColor,
        title: const Text('Login Using Mobile Number'),
      ),
    );
  }
}

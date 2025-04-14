import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/screens/login_using_mobile_number.dart';
import 'package:smile_chat/features/landing/presentation/screens/landing_sscreen.dart';
import 'package:smile_chat/utils/constant.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case loginUsingMobileNumber:
        return MaterialPageRoute(
            builder: (_) => const LoginUsingMobileNumber());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('This page doesn\'t exist'),
          ),
        );
    }
  }
}

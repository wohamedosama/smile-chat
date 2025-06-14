import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/screens/get_otp_screen.dart';
import 'package:smile_chat/features/auth/presentation/screens/login_using_mail_id_screen.dart';
import 'package:smile_chat/features/auth/presentation/screens/login_using_mobile_number.dart';
import 'package:smile_chat/features/auth/presentation/screens/register_screen.dart';
import 'package:smile_chat/features/chats/presentation/screens/chats_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/home_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/profile_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/search_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/story_view_screen.dart';
import 'package:smile_chat/features/landing/presentation/screens/landing_sscreen.dart';
import 'package:smile_chat/utils/constant.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case loginUsingMobileNumber:
        return MaterialPageRoute(
            builder: (_) => const LoginUsingMobileNumber());

      case getOTPScreen:
        return MaterialPageRoute(builder: (_) => const GETOTPScereen());

      case loginUsingEmail:
        return MaterialPageRoute(
            builder: (_) => const LoginUsingMailIdScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case storyViewedScreen:
        return MaterialPageRoute(builder: (_) => StoryViewScreen());
      case chatsScreen:
        return MaterialPageRoute(builder: (_) => const ChatsScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('This page doesn\'t exist'),
          ),
        );
    }
  }
}

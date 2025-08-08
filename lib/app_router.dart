import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:smile_chat/features/auth/presentation/screens/get_otp_screen.dart';
import 'package:smile_chat/features/auth/presentation/screens/login_using_mail_id_screen.dart';
import 'package:smile_chat/features/auth/presentation/screens/login_using_mobile_number.dart';
import 'package:smile_chat/features/auth/presentation/screens/register_screen.dart';
import 'package:smile_chat/features/chats/cubit/chat_cubit.dart';
import 'package:smile_chat/features/chats/presentation/screens/chats_screen.dart';
import 'package:smile_chat/features/home/cubit/search_cubit/search_cubit.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/features/home/presentation/screens/home_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/profile_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/search_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/story_view_screen.dart';
import 'package:smile_chat/features/landing/presentation/screens/landing_sscreen.dart';
import 'package:smile_chat/services/depnedancy_injectaion.dart';
import 'package:smile_chat/utils/constant.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case loginUsingMobileNumber:
        return MaterialPageRoute(
          builder: (_) => LoginUsingMobileNumber(),
        );

      case getOTPScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => GETOTPScereen(phoneNumber: phoneNumber),
        );

      case loginUsingEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EmailAuthCubit>.value(
            value: getIt<EmailAuthCubit>(),
            child: const LoginUsingMailIdScreen(),
          ),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EmailAuthCubit>.value(
            value: getIt<EmailAuthCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EmailAuthCubit>.value(
            value: getIt<EmailAuthCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ChatCubit>.value(
                  value: getIt<ChatCubit>(),
                  child: const HomeScreen(),
                ));
      case searchScreen:
        final chats = settings.arguments as List<ChatModel>? ?? [];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<SearchCubit>(),
            child: SearchScreen(chats: chats),
          ),
        );
      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case storyViewedScreen:
        return MaterialPageRoute(builder: (_) => StoryViewScreen());
      case chatsScreen:
        final chat = settings.arguments as ChatModel;
        return MaterialPageRoute(
          builder: (_) => ChatsScreen(chatModel: chat),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('This page doesn\'t exist'),
          ),
        );
    }
  }
}

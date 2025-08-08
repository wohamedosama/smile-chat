import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smile_chat/app_router.dart';
import 'package:smile_chat/features/error/screens/modern_error_screen.dart';
import 'package:smile_chat/features/landing/presentation/screens/landing_sscreen.dart';
import 'package:smile_chat/firebase_options.dart';
import 'package:smile_chat/my_observer.dart';
import 'package:smile_chat/services/depnedancy_injectaion.dart';

Future<void> main() async {
  ErrorWidget.builder =
      (FlutterErrorDetails details) => ModernErrorScreen(errorDetails: details);
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const SmileChat());
}

class SmileChat extends StatelessWidget {
  const SmileChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
      home: const LandingScreen(),
    );
  }
}

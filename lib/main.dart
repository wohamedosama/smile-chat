import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smile_chat/app_router.dart';
import 'package:smile_chat/features/error/screens/modern_error_screen.dart';
import 'package:smile_chat/features/landing/presentation/screens/landing_sscreen.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => ModernErrorScreen(
        errorDetails: details,
      );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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

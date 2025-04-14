import 'package:flutter/material.dart';
import 'package:smile_chat/features/landing/presentation/widgets/login_buttons.dart';
import 'package:smile_chat/features/landing/presentation/widgets/login_using_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/sub_title_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/welcome_back_text_widget.dart';

class LandingSscreen extends StatelessWidget {
  const LandingSscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            WelcomeBackWidgetText(),
            SizedBox(height: 24),
            SubTitleWidget(),
            SizedBox(height: 30),
            LoginUsingWidget(),
            const Spacer(),
            LoginButtons(),
          ],
        ),
      ),
    );
  }
}

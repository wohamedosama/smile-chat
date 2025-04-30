import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/otp_input_instructions.dart';
import 'package:smile_chat/features/auth/presentation/widgets/pin_code_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/you_didnot_receive_code_text_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';

class GETOTPScereen extends StatelessWidget {
  const GETOTPScereen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              const CustomAppBar(isThatContainImage: false),
              const SizedBox(height: 40),
              OTPInputInstructions(),
              const Spacer(),
              const PinCodeWidget(),
              const Spacer(flex: 2),
              const YouDidnotReceiveCodeTextWidget(),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomElevatedButton(onPressed: () {}, text: 'Continue'),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

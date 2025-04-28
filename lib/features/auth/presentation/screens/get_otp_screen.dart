import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/otp_input_instructions.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(isThatContainImage: false),
              const SizedBox(height: 40),
              OTPInputInstructions(),
              const Spacer(),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  textStyle: AppStyles.styleMediumWithWhiteColor16,
                  appContext: context,
                  length: 4,
                  pastedTextStyle: AppStyles.styleMediumWithMidGrayColor16,
                  //    animationType: AnimationType.slide,
                  // validator: (value) {
                  //   if (value!.length < 4) {
                  //     return "Please enter 4 digits OTP";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  pinTheme: PinTheme(
                    activeColor: AppColor.whiteColor,
                    inactiveColor: AppColor.lightBlueColor,
                    inactiveFillColor: AppColor.lightBlueColor,
                    activeFillColor: AppColor.lightBlueColor,
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 48,
                    fieldWidth: 48,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  cursorColor: AppColor.whiteColor,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'if you didn’t receive a code?',
                          style: AppStyles.styleMediumWithWhiteColor16
                              .copyWith(color: const Color(0xffcccccc))),
                      TextSpan(
                          text: ' 00:00',
                          style: AppStyles.styleMediumWithLightBlueColor16),
                    ],
                  ),
                ),
              ),
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

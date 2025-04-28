import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class GETOTPScereen extends StatelessWidget {
  const GETOTPScereen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  height: 50,
                  Assets.assetsImagesArrowBackIcon,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 6,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Now,Enter 4 Digit OTP we sent to you',
                          style: AppStyles.styleMedium19,
                          maxLines: 2,
                        ),
                        Text(
                          'sent to +91 98745 63210',
                          style: AppStyles.stylelightWithLightPurbleColor16
                              .copyWith(
                            color: Color(0xffcccccc),
                          ),
                          maxLines: 2,
                        ),
                        Text('Use a different number',
                            style: AppStyles.stylelightWithLightPurbleColor16),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  SvgPicture.asset(Assets.assetsImagesEnterOtpCodeImage)
                ],
              ),
              Spacer(),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  textStyle: AppStyles.styleMediumWithWhiteColor16,
                  appContext: context,
                  length: 4,
                  pastedTextStyle: AppStyles.styleMediumWithMidGrayColor16,
                  animationType: AnimationType.slide,
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
                  animationDuration: Duration(milliseconds: 300),
                ),
              ),
              Spacer(
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
                              .copyWith(color: Color(0xffcccccc))),
                      TextSpan(
                          text: ' 00:00',
                          style: AppStyles.styleMediumWithLightBlueColor16),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomElevatedButton(onPressed: () {}, text: 'Continue'),
                ],
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

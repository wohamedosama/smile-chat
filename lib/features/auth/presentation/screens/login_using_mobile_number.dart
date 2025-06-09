import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';
import 'package:smile_chat/utils/constant.dart';

class LoginUsingMobileNumber extends StatelessWidget {
  const LoginUsingMobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomAppBar(
                        isThatContainImage: true,
                      ),
                      const SizedBox(height: 30),
                      CustomTextWidget(
                        textModel: TextModel(
                          text: 'Hello!',
                          style: AppStyles.styleSemiBoldwhiteColor45,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextWidget(
                        textModel: TextModel(
                          text:
                              'we are requesting your mobile number just to enter our platform for login purpose.',
                          style: AppStyles.styleRegular16
                              .copyWith(color: AppColor.whiteColor),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const CustomPNGImage(
                          imagePath: Assets.assetsImagesPhoneAuthImage),
                      const SizedBox(height: 20),
                      const EnterMobileNumberTextField(),
                      const SizedBox(height: 35),
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, getOTPScreen);
                        },
                        text: 'Get OTP',
                      ),
                      const SizedBox(height: 40),
                      const TermsAndConditionsWidget(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

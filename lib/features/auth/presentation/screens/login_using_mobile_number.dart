import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_png_image.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/enter_mobile_number_text_field.dart';
import 'package:smile_chat/features/auth/presentation/widgets/terms_and_conditions_list.dart';
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
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomAppBar(
                        isThatContainImage: true,
                      ),
                      SizedBox(height: 30),
                      CustomTextWidget(
                        textModel: TextModel(
                          text: 'Hello!',
                          style: AppStyles.styleSemiBoldwhiteColor45,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextWidget(
                        textModel: TextModel(
                          text:
                              'we are requesting your mobile number just to enter our platform for login purpose.',
                          style: AppStyles.styleRegular16
                              .copyWith(color: AppColor.whiteColor),
                        ),
                      ),
                      SizedBox(height: 25),
                      CustomPNGImage(
                          imagePath: Assets.assetsImagesPhoneAuthImage),
                      SizedBox(height: 20),
                      EnterMobileNumberTextField(),
                      SizedBox(height: 35),
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, getOTPScreen);
                        },
                        text: 'Get OTP',
                      ),
                      SizedBox(height: 40),
                      TermsAndConditionsWidget(),
                      SizedBox(height: 30),
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

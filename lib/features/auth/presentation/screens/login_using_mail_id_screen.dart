import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_using_email_id_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_divider.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/features/landing/presentation/widgets/welcome_back_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class LoginUsingMailIdScreen extends StatelessWidget {
  const LoginUsingMailIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoginUsingMailIdAppBar(),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: AppColor.deepPurbleColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const CustomSVGImage(
                          imagePath: Assets.assetsImagesGoogle),
                    ),
                    const SizedBox(height: 40),
                    CustomDivider(style: AppStyles.styleExtraBold16),
                    const SizedBox(height: 40),
                    TextFormField(
                      style: AppStyles.styleRegularWithWhiteColor16,
                      cursorColor: AppColor.whiteColor,
                      decoration: InputDecoration(
                        labelText: 'Your email',
                        labelStyle: AppStyles.styleRegularWithWhiteColor16,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.speicalGray, strokeAlign: 2),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.whiteColor, strokeAlign: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      style: AppStyles.styleRegularWithWhiteColor16,
                      cursorColor: AppColor.whiteColor,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: AppStyles.styleRegularWithWhiteColor16,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.speicalGray, strokeAlign: 2),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.whiteColor, strokeAlign: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Forgot password?',
                              style: AppStyles.styleRegular14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Column(
                      spacing: 50,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomElevatedButton(
                          onPressed: () {},
                          text: 'Log in',
                          backgroundColor: AppColor.whiteColor,
                          textStyle: AppStyles.styleExtraBold16
                              .copyWith(color: AppColor.blackColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                              textModel: TextModel(
                                  text: 'Create user ?',
                                  style: AppStyles.styleSemiBold14),
                            ),
                            CustomTextWidget(
                              textModel: TextModel(
                                  text: 'Register',
                                  style: AppStyles.styleSemiBold16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

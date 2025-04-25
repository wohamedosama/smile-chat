import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: AppColor.primayColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 15),
                Row(
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
                    Spacer(),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        fit: BoxFit.cover,
                        Assets.assetsImagesLogo,
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 50),
                Text(
                  'Hello!',
                  style: AppStyles.styleSemiBoldwhiteColor45,
                ),
                SizedBox(height: 10),
                Text(
                  'we are requesting your mobile number just to enter our platform for login purpose.',
                  style: AppStyles.styleRegular16
                      .copyWith(color: AppColor.whiteColor),
                ),
                SizedBox(height: 25),
                Image.asset(
                  Assets.assetsImagesPhoneAuthImage,
                  fit: BoxFit.contain,
                ),

                TextFormField(
                  style: AppStyles.styleMediumWithWhiteColor16,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 12),
                        Text(
                          '+91',
                          style: AppStyles.styleRegular16
                              .copyWith(color: Color(0xffcccccc)),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xffcccccc),
                        ),
                        const SizedBox(width: 8),
                        Container(
                            width: 1, height: 24, color: Color(0xffcccccc)),
                        const SizedBox(width: 8),
                      ],
                    ),
                    hintText: "Enter Mobile Number",
                    hintStyle: AppStyles.styleRegular16
                        .copyWith(color: Color(0xffcccccc)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffcccccc)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffcccccc)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, getOTPScreen);
                  },
                  text: 'Get OTP',
                ),
                SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'By signing ,you agree to our\n',
                          style: AppStyles.styleMediumWithWhiteColor16),
                      TextSpan(
                          text: 'Terms of Service',
                          style: AppStyles.styleMediumWithLightBlueColor16),
                      TextSpan(
                          text: ' &',
                          style: AppStyles.styleMediumWithWhiteColor16),
                      TextSpan(
                          text: ' Privacy',
                          style: AppStyles.styleMediumWithLightBlueColor16),
                    ],
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

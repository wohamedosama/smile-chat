import 'package:flutter/material.dart';
import 'package:smile_chat/features/landing/presentation/widgets/welcome_back_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'We have created', style: AppStyles.styleRegular16),
                  TextSpan(
                      text: ' Smilechat ',
                      style: AppStyles.styleSemiBold16
                          .copyWith(color: Color(0xff130856))),
                  TextSpan(
                      text:
                          'App with two different login.User can  prefer the way to login',
                      style: AppStyles.styleRegular16),
                ],
              ),
            ),
            SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(Assets.assetsImagesLogo,
                    height: 200, width: 290, fit: BoxFit.cover),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    'Login using',
                    style: AppStyles.styleSemiBoldBlackColor45,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.lightBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Mobile number',
                      style: AppStyles.styleMediumWithWhiteColor16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 1.5,
                        color: const Color(0xffCDD1D0),
                      ),
                    ),
                    Text('OR',
                        style: AppStyles.styleRegular14
                            .copyWith(color: AppColor.primayColor)),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 1.5,
                        color: const Color(0xffCDD1D0),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.lightBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Email IDs',
                      style: AppStyles.styleMediumWithWhiteColor16,
                    ),
                  ),
                ),
                SizedBox(height: 47),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

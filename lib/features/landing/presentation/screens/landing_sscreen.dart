import 'package:flutter/material.dart';
import 'package:smile_chat/features/landing/presentation/widgets/login_using_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/or_divider.dart';
import 'package:smile_chat/features/landing/presentation/widgets/sub_title_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/welcome_back_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Mobile number',
                ),
                OrDivider(),
                CustomElevatedButton(onPressed: () {}, text: 'Email id'),
                SizedBox(height: 47),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColor.lightBlueColor,
    this.textStyle,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          text,
          style: textStyle ?? AppStyles.styleMediumWithWhiteColor16,
        ),
      ),
    );
  }
}

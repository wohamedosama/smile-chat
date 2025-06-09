import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        textStyle: AppStyles.styleMediumWithWhiteColor16,
        appContext: context,
        length: 4,
        pastedTextStyle: AppStyles.styleMediumWithMidGrayColor16,
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
    );
  }
}

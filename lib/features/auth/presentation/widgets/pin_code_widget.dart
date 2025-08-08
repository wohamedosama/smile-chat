// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    super.key,
    this.phoneNumber = '',
  });
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PinCodeTextField(
        autoFocus: true,
        keyboardType: TextInputType.number,
        textStyle: AppStyles.styleMediumWithWhiteColor16,
        appContext: context,
        length: 6,
        pastedTextStyle: AppStyles.styleMediumWithMidGrayColor16,
        onCompleted: (value) => print('Completed'),
        onChanged: (value) => print(value),
        pinTheme: PinTheme(
          activeColor: AppColor.whiteColor,
          inactiveColor: AppColor.lightBlueColor,
          inactiveFillColor: AppColor.lightBlueColor,
          activeFillColor: AppColor.lightBlueColor,
          shape: PinCodeFieldShape.box,
          fieldHeight: 45,
          fieldWidth: 45,
          borderRadius: BorderRadius.circular(10),
        ),
        cursorColor: AppColor.whiteColor,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class EnterMobileNumberTextField extends StatelessWidget {
  EnterMobileNumberTextField({
    super.key,
    required this.phoneNumber,
  });

  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          MyToast.showToast(
              message: 'Please Enter Your  Number', state: ToastState.warning);
        } else if (value.length < 11) {
          MyToast.showToast(
              message: 'Please Enter a Vaild Number',
              state: ToastState.warning);
        }
        return null;
      },
      onSaved: (value) {
        print(value.toString());
        phoneNumber = value!;
      },
      style: AppStyles.styleMediumWithWhiteColor16,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12),
            Text('+20',
                style: AppStyles.styleRegular16
                    .copyWith(color: const Color(0xffcccccc))),
            const Icon(Icons.arrow_drop_down, color: Color(0xffcccccc)),
            const SizedBox(width: 8),
            Container(width: 1, height: 24, color: const Color(0xffcccccc)),
            const SizedBox(width: 8),
          ],
        ),
        hintText: "Enter Mobile Number",
        hintStyle:
            AppStyles.styleRegular16.copyWith(color: const Color(0xffcccccc)),
        enabledBorder: enabledBorder(),
        focusedBorder: focusedBorder(),
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffcccccc)),
      borderRadius: BorderRadius.circular(16),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffcccccc)),
      borderRadius: BorderRadius.circular(16),
    );
  }
}

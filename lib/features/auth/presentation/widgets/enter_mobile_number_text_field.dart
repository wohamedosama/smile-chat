import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class EnterMobileNumberTextField extends StatelessWidget {
  const EnterMobileNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.styleMediumWithWhiteColor16,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12),
            Text('+91',
                style: AppStyles.styleRegular16
                    .copyWith(color: Color(0xffcccccc))),
            const Icon(Icons.arrow_drop_down, color: Color(0xffcccccc)),
            const SizedBox(width: 8),
            Container(width: 1, height: 24, color: Color(0xffcccccc)),
            const SizedBox(width: 8),
          ],
        ),
        hintText: "Enter Mobile Number",
        hintStyle: AppStyles.styleRegular16.copyWith(color: Color(0xffcccccc)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffcccccc)),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffcccccc)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

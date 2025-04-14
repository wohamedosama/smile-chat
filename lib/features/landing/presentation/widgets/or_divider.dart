import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 1.5,
            color: const Color(0xffCDD1D0),
          ),
        ),
        Text('OR',
            style:
                AppStyles.styleRegular14.copyWith(color: AppColor.primayColor)),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 1.5,
            color: const Color(0xffCDD1D0),
          ),
        ),
      ],
    );
  }
}

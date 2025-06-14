import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class SenderItem extends StatelessWidget {
  const SenderItem({
    super.key,
    required this.now,
    required this.formatter,
  });

  final DateTime now;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BubbleSpecialTwo(
          sent: true,
          text: 'Hello! Kathryn Murphy',
          color: AppColor.greenColor,
          tail: false,
          textStyle:
              AppStyles.styleSemiBold14.copyWith(color: AppColor.whiteColor),
        ),
        Container(
          padding: const EdgeInsets.only(right: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              now.hour > 12 ? formatter.format(now) : formatter.format(now),
              style: AppStyles.styleSemiBold14
                  .copyWith(color: AppColor.midGrayColor),
            ),
          ),
        ),
      ],
    );
  }
}

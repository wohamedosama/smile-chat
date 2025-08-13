import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class ReceiverItem extends StatelessWidget {
  const ReceiverItem({
    super.key,
    required this.now,
    required this.formatter,
    // this.chatImage,
  });

  final DateTime now;
  final DateFormat formatter;
  //final String? chatImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BubbleSpecialTwo(
                  text:
                      'Hello ! Nazrul How are mohmaed ? Hello ! Nazrul How are mohmaed ?',
                  isSender: false,
                  color: const Color(0xffF2F7FB),
                  tail: false,
                  textStyle: AppStyles.styleSemiBold14
                      .copyWith(color: AppColor.blackColor),
                ),
                // if (chatImage != null && chatImage!.isNotEmpty)
                //   Container(
                //     margin: const EdgeInsets.only(left: 12, top: 8),
                //     child: CircleAvatar(
                //       radius: 16,
                //       backgroundImage: NetworkImage(chatImage!),
                //       onBackgroundImageError: (exception, stackTrace) {
                //         // Handle image loading error
                //       },
                //     ),
                //   ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 12),
                    child: Text(
                      now.hour > 12
                          ? formatter.format(now)
                          : formatter.format(now),
                      style: AppStyles.styleSemiBold14
                          .copyWith(color: AppColor.midGrayColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

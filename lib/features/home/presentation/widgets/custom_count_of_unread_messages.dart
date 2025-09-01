import 'package:flutter/material.dart';
import 'package:smile_chat/features/chats/model/chat_model.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomCountOfUnreadMessage extends StatelessWidget {
  const CustomCountOfUnreadMessage({super.key, required this.model});
  final ChatModel model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -8,
      right: -2,
      child: model.unReadMessagsCount == 0
          ? Container()
          : Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                model.unReadMessagsCount.toString(),
                style: AppStyles.styleExtraBold12
                    .copyWith(color: AppColor.whiteColor),
              ),
            ),
    );
  }
}

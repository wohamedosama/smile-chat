import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class AllChatEmptyWidget extends StatelessWidget {
  const AllChatEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            color: Colors.grey[400],
            size: 64,
          ),
          const SizedBox(height: 16),
          CustomTextWidget(
            textModel: TextModel(
              text: 'No chats yet',
              style: AppStyles.styleMedium20
                  .copyWith(color: AppColor.darkGrayColor),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextWidget(
            textModel: TextModel(
              text: 'Start a conversation with your friends!',
              style: AppStyles.styleMediam14
                  .copyWith(color: AppColor.darkGrayColor),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextWidget(
            textModel: TextModel(
              text: 'Tap the + button to start a new chat',
              style: AppStyles.styleMediam14.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

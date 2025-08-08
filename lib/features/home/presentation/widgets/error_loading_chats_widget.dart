import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class ErrorLoadingChatWidget extends StatelessWidget {
  const ErrorLoadingChatWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });
  final String errorMessage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColor.darkGrayColor,
            size: 48,
          ),
          const SizedBox(height: 16),
          CustomTextWidget(
            textModel: TextModel(
              text: 'Error loading chats',
              style: AppStyles.styleMedium20
                  .copyWith(color: AppColor.darkGrayColor),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextWidget(
            textModel: TextModel(
              text: errorMessage,
              style: AppStyles.styleMediam14
                  .copyWith(color: AppColor.darkGrayColor),
            ),
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(onPressed: onPressed, text: 'Rerty'),
        ],
      ),
    );
  }
}

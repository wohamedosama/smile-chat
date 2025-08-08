import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class NoResultsFoundWhenYouSearchWidget extends StatelessWidget {
  const NoResultsFoundWhenYouSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          CustomTextWidget(
              textModel: TextModel(
            text: 'No chats found',
            style: AppStyles.styleMediumWithMidGrayColor16,
          )),
          const SizedBox(height: 8),
          CustomTextWidget(
            textModel: TextModel(
              text: 'Try searching with a different name',
              style: AppStyles.styleSemiBold14,
            ),
          ),
        ],
      ),
    );
  }
}

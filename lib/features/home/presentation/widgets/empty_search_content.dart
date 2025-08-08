import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class EmptySearchContent extends StatelessWidget {
  const EmptySearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          CustomTextWidget(
            textModel: TextModel(
              text: 'Click on search bar to start a search',
              style: AppStyles.styleMediumWithMidGrayColor16,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextWidget(
            textModel: TextModel(
              text: 'Search for your chats by name',
              style: AppStyles.styleSemiBold14,
            ),
          ),
        ],
      ),
    );
  }
}

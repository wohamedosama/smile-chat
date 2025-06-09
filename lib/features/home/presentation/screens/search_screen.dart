import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_list_view.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_text_form_field.dart';
import 'package:smile_chat/utils/app_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: SafeArea(
          child: Column(
            children: [
              //? Try to use the Anchor Search or Search bar and understand the difference between both of them
              SearchTextFromField(),
              SizedBox(height: 25),
              SearchListView(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

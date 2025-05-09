import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_list_view.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              SearchTextFromField(),
              SizedBox(height: 25),
              SearchListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchTextFromField extends StatelessWidget {
  const SearchTextFromField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff24786D),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: () {}, child: Image.asset(Assets.assetsImagesRemoveIcon)),
        labelText: 'People',
        labelStyle:
            AppStyles.styleMediam14.copyWith(color: AppColor.blackColor),
        prefixIcon: GestureDetector(
            onTap: () {}, child: Image.asset(Assets.assetsImagesSearchIcon)),
        filled: true,
        fillColor: const Color(0xffF3F6F6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffF3F6F6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffF3F6F6)),
        ),
      ),
    );
  }
}

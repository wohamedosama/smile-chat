import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                cursorColor: const Color(0xff24786D),
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Image.asset(Assets.assetsImagesRemoveIcon)),
                  labelText: 'People',
                  labelStyle: AppStyles.styleMediam14
                      .copyWith(color: AppColor.blackColor),
                  prefixIcon: GestureDetector(
                      onTap: () {},
                      child: Image.asset(Assets.assetsImagesSearchIcon)),
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
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  child: Image.asset(
                    Assets.assetsImagesPerson2,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(
                  'Adil Adnan',
                  style: AppStyles.styleBold16
                      .copyWith(color: AppColor.blackColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  'Be your own hero 💪',
                  style: AppStyles.styleExtraBold16
                      .copyWith(color: AppColor.midGrayColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

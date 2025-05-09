import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_images.dart';

class SearchTextFromField extends StatelessWidget {
  const SearchTextFromField({
    this.onTapRemoveIcon,
    this.onTapSearchIcon,
    super.key,
  });
  final void Function()? onTapSearchIcon;
  final void Function()? onTapRemoveIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff24786D),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: onTapSearchIcon,
            child: Image.asset(Assets.assetsImagesRemoveIcon)),
        prefixIcon: GestureDetector(
            onTap: onTapRemoveIcon,
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
    );
  }
}

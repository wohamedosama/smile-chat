import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_images.dart';

class SearchTextFromField extends StatelessWidget {
  const SearchTextFromField({
    this.onTapRemoveIcon,
    this.onTapSearchIcon,
    required this.controller,
    this.onChanged,
    super.key,
  });
  final void Function()? onTapSearchIcon;
  final void Function()? onTapRemoveIcon;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged!,
      cursorColor: const Color(0xff24786D),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: onTapRemoveIcon,
            child: Image.asset(Assets.assetsImagesRemoveIcon)),
        prefixIcon: GestureDetector(
            onTap: onTapSearchIcon,
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

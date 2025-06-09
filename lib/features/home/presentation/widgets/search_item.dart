import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/search_model.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.model});
  final SearchModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        child: Image.asset(
          model.image,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        model.text,
        style: AppStyles.styleBold16.copyWith(color: AppColor.blackColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        model.subtitle,
        style:
            AppStyles.styleExtraBold16.copyWith(color: AppColor.midGrayColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

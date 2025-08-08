import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.model});
  final ChatModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColor.primaryColor,
        child: buildChatImage(model.image),
      ),
      title: Text(
        model.name,
        style: AppStyles.styleBold16.copyWith(color: AppColor.blackColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        model.lastMessage,
        style:
            AppStyles.styleExtraBold16.copyWith(color: AppColor.midGrayColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildChatImage(String? image) {
    if (image == null || image.isEmpty) {
      return const Icon(Icons.person);
    }
    if (image.startsWith('http')) {
      return ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 56,
          height: 56,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person);
          },
        ),
      );
    } else {
      return ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 56,
          height: 56,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person);
          },
        ),
      );
    }
  }
}

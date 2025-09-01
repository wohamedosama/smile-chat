import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smile_chat/features/chats/model/chat_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/build_circle_action.dart';
import 'package:smile_chat/features/home/presentation/widgets/customize_chat_image.dart';
import 'package:smile_chat/features/home/presentation/widgets/unraed_messages_and_the_time_of_chat.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.model});
  final ChatModel model;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          BuildCircleAction(
            onTap: () {},
            color: AppColor.blackColor,
            iconAsset: Assets.assetsImagesNotification,
          ),
          BuildCircleAction(
            onTap: () {},
            color: AppColor.redColor,
            iconAsset: Assets.assetsImagesTrash,
          ),
        ],
      ),
      child: ListTile(
        leading: CustomizeChatImage(
          model: model,
        ),
        title: Text(
          model.name,
          style: AppStyles.styleMedium20,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          model.lastMessage,
          style: AppStyles.styleBold12,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: SizedBox(
            width: 80, child: UnreadMessagesAndTimeOfTheChat(model: model)),
      ),
    );
  }
}

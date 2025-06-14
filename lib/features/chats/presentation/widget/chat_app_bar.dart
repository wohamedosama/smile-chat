import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/features/home/presentation/widgets/audio_and_video_call_widget.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class ChatsAppBar extends StatelessWidget {
  const ChatsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomSVGImage(
              imagePath: Assets.assetsImagesBlackArrowButton,
              fit: BoxFit.cover,
              height: 16),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: ListTile(
            leading: CircleAvatar(
                radius: 24, child: Image.asset(Assets.assetsImagesPerson10)),
            title: Text(
              'Mohame Osama',
              style: AppStyles.styleMediumWithBlackColor16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Avtive Now',
                style: AppStyles.styleSemiBold14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(width: 12),
        const AudioAndVideoCallsWidget(
          isChatScreen: true,
        ),
      ],
    );
  }
}

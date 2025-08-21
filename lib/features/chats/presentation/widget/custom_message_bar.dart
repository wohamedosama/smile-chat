import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class CustomMessageBar extends StatelessWidget {
  const CustomMessageBar({
    super.key,
    required this.messageController,
    required this.onSend,
    this.isTyping = false,
    this.chatImage,
    this.onSubmitted,
  });
  final TextEditingController messageController;
  final VoidCallback onSend;
  final bool isTyping;
  final String? chatImage;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: const BoxDecoration(color: AppColor.whiteColor),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.assetsImagesAttachment),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: onSubmitted,
                      onTap: () {},
                      controller: messageController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 6),
                        hintText: "Write Your Message",
                        hintStyle: AppStyles.styleSemiBold12.copyWith(
                            color: AppColor.blackColor, letterSpacing: 1),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // access to open your files and attach from it to send it to the user
                  IconButton(
                    icon: SvgPicture.asset(Assets.assetsImagesFiles),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          // toggle between the send button or camera and record button depend on text filed state
          isTyping
              ? GestureDetector(
                  onTap: onSend,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                )
              : Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(Assets.assetsImagesCameraIcon),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(Assets.assetsImagesMicrophoneIcon),
                      onPressed: () {},
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

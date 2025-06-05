// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/features/home/presentation/widgets/audio_and_video_call_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm a');

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ChatsAppBar(),
              const SizedBox(height: 60),
              DateChip(
                date: DateTime(now.year, now.month, now.day - 1),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) =>
                      ChatBubbleItem(now: now, formatter: formatter),
                ),
              ),
              CustomMessageBar(
                messageController: TextEditingController(),
                onSend: () {},
              )
              // MessageBar(
              //   onSend: (_) {},
              //   actions: [
              //     InkWell(
              //         onTap: () {},
              //         child: SvgPicture.asset(Assets.assetsImagesSendIcon)),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 8, right: 8),
              //       child: InkWell(
              //         child: const Icon(
              //           Icons.camera_alt,
              //           color: Colors.green,
              //           size: 24,
              //         ),
              //         onTap: () {},
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubbleItem extends StatelessWidget {
  const ChatBubbleItem({
    super.key,
    required this.now,
    required this.formatter,
  });

  final DateTime now;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BubbleSpecialTwo(
              sent: true,
              text: 'Hello! Kathryn Murphy',
              color: AppColor.greenColor,
              tail: false,
              textStyle: AppStyles.styleSemiBold14
                  .copyWith(color: AppColor.whiteColor),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  now.hour > 12 ? formatter.format(now) : formatter.format(now),
                  style: AppStyles.styleSemiBold14
                      .copyWith(color: AppColor.midGrayColor),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BubbleSpecialTwo(
                      text: 'Hello ! Nazrul How are you?',
                      isSender: false,
                      color: const Color(0xffF2F7FB),
                      tail: false,
                      textStyle: AppStyles.styleSemiBold14
                          .copyWith(color: AppColor.blackColor),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0, right: 12),
                        child: Text(
                          now.hour > 12
                              ? formatter.format(now)
                              : formatter.format(now),
                          style: AppStyles.styleSemiBold14
                              .copyWith(color: AppColor.midGrayColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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

class CustomMessageBar extends StatefulWidget {
  const CustomMessageBar({
    super.key,
    required this.messageController,
    required this.onSend,
    this.isTyping = false,
  });
  final TextEditingController messageController;
  final VoidCallback onSend;
  final bool isTyping;

  @override
  State<CustomMessageBar> createState() => _CustomMessageBarState();
}

class _CustomMessageBarState extends State<CustomMessageBar> {
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
                      onTap: () {
                        setState(() {
                          widget.isTyping == true;
                        });
                      },
                      controller: widget.messageController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 6),
                        hintText: "Write Your Message",
                        hintStyle: AppStyles.styleSemiBold12.copyWith(
                            color: AppColor.blackColor, letterSpacing: 1),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(Assets.assetsImagesFiles),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          widget.isTyping
              ? GestureDetector(
                  onTap: widget.onSend,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/features/home/model/calls_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/audio_and_video_call_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class CallHistoryListTile extends StatelessWidget {
  const CallHistoryListTile({
    super.key,
    required this.profileImage,
    required this.title,
    required this.subtitle,
    required this.typeOfCall,
  });
  final String profileImage, title, subtitle;
  final StatusOfCall typeOfCall;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: AppColor.primaryColor,
        child: Image.asset(
          profileImage,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        title,
        style: AppStyles.styleMedium20,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          getCallIcon(typeOfCall),
          const SizedBox(width: 6),
          Text(
            subtitle,
            style: AppStyles.styleExtraBold14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: const AudioAndVideoCallsWidget(),
    );
  }
}

SvgPicture getCallIcon(StatusOfCall type) {
  switch (type) {
    case StatusOfCall.incomingCall:
      return SvgPicture.asset(Assets.assetsImagesIncommingCallsIcon);
    case StatusOfCall.declindcall:
      return SvgPicture.asset(Assets.assetsImagesMissidCallIcon);
    case StatusOfCall.outgoingcall:
      return SvgPicture.asset(Assets.assetsImagesOutcommingCallIcon);
  }
}

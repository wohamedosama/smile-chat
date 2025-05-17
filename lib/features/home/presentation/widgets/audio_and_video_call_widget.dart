import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/utils/app_images.dart';

class AudioAndVideoCallsWidget extends StatelessWidget {
  const AudioAndVideoCallsWidget({
    super.key,
    this.onTapAudioCall,
    this.onTapVideoCall,
  });
  final void Function()? onTapAudioCall;
  final void Function()? onTapVideoCall;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: onTapAudioCall,
            child: SvgPicture.asset(Assets.assetsImagesAudioCall)),
        const SizedBox(width: 18),
        GestureDetector(
            onTap: onTapVideoCall,
            child: SvgPicture.asset(Assets.assetsImagesVideoCall))
      ],
    );
  }
}

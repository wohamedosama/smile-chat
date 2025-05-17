import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/features/home/model/calls_model.dart';
import 'package:smile_chat/features/home/model/data/calls_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_contact_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Column(
              children: [
                SizedBox(height: 40),
                CustomContactsAppBar(title: 'Calls'),
                SizedBox(height: 25),
              ],
            ),
          ),
          CustomCallContainer()
        ],
      ),
    );
  }
}

class CustomCallContainer extends StatelessWidget {
  const CustomCallContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: AppColor.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Recent',
                  style: AppStyles.styleMedium20,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.primaryColor,
                      child: Image.asset(
                        callModel[index].profileImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      callModel[index].title,
                      style: AppStyles.styleMedium20,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Row(
                      children: [
                        getCallIcon(callModel[index].typeOfCall),
                        const SizedBox(width: 6),
                        Text(
                          callModel[index].subtitle,
                          style: AppStyles.styleExtraBold14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            child:
                                SvgPicture.asset(Assets.assetsImagesAudioCall)),
                        const SizedBox(width: 18),
                        GestureDetector(
                            child:
                                SvgPicture.asset(Assets.assetsImagesVideoCall))
                      ],
                    ),
                  ),
                  itemCount: callModel.length,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
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

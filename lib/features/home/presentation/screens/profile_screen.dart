import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_png_image.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/features/home/model/settings_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_setting_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.isSubTitleEqualNull = false,
  });
  final bool isSubTitleEqualNull;
  final List<SettingsModel> model = const [
    SettingsModel(
      image: Assets.assetsImagesKeysIcon,
      title: 'Account',
      subTitle: 'Privacy, security, change number',
    ),
    SettingsModel(
      image: Assets.assetsImagesMessageIcno,
      title: 'Chat',
      subTitle: 'Chat history,theme,wallpapers',
    ),
    SettingsModel(
      image: Assets.assetsImagesNotificationIcon,
      title: 'Notifications',
      subTitle: 'Messages, group and others',
    ),
    SettingsModel(
      image: Assets.assetsImagesHelp,
      title: 'Help',
      subTitle: 'Help center,contact us, privacy policy',
    ),
    SettingsModel(
      image: Assets.assetsImagesData,
      title: 'Storage and data',
      subTitle: 'Network usage, stogare usage',
    ),
    SettingsModel(
      image: Assets.assetsImagesUsers,
      title: 'Invite a friend',
      subTitle: '',
    ),
    SettingsModel(
      image: Assets.assetsImagesLogout,
      title: 'Logout',
      subTitle: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deepPurbleColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CustomSettingAppBar(),
                  SizedBox(height: 70),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: AppColor.whiteColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ProfileImageInProfileScreen(),
                      const SizedBox(height: 25),
                      Expanded(
                          child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          spacing: 18,
                          children: model.map((item) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColor.iconBackGroundColor,
                                radius: 34,
                                child: CustomSVGImage(
                                  imagePath: item.image,
                                  height: 32,
                                ),
                              ),
                              title: item.title == 'Logout'
                                  ? Text(
                                      item.title,
                                      style: AppStyles.styleMedium19
                                          .copyWith(color: AppColor.redColor),
                                    )
                                  : Text(
                                      item.title,
                                      style: AppStyles.styleMedium19.copyWith(
                                          color: AppColor.darkerBlackColor),
                                    ),
                              subtitle: item.subTitle!.isNotEmpty
                                  ? Text(
                                      item.subTitle!,
                                      style: AppStyles.styleExtraBold16
                                          .copyWith(
                                              color: AppColor.midGrayColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : null,
                            );
                          }).toList(),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageInProfileScreen extends StatelessWidget {
  const ProfileImageInProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
          radius: 30,
          child:
              CustomPNGImage(height: 60, imagePath: Assets.assetsImagesPerson)),
      title: Text(
        "Mohamed Osama",
        style: AppStyles.styleBold20.copyWith(color: AppColor.darkerBlackColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        "Hello Every one with you mohmed osama Flutter developer",
        style:
            AppStyles.styleExtraBold16.copyWith(color: AppColor.midGrayColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

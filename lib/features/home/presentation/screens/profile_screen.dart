import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/features/home/model/data/settings_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_setting_app_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/logedin_user_in_the_profile_screen.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.isSubTitleEqualNull = false,
  });
  final bool isSubTitleEqualNull;

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
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LogedInUserInTheProfileScreen(),
                      SizedBox(height: 25),
                      SettingsItemsTile()
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

class SettingsItemsTile extends StatelessWidget {
  const SettingsItemsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 18,
        children: settingsItemList.map((item) {
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
                    style: AppStyles.styleMedium19
                        .copyWith(color: AppColor.darkerBlackColor),
                  ),
            subtitle: item.subTitle!.isNotEmpty
                ? Text(
                    item.subTitle!,
                    style: AppStyles.styleExtraBold16
                        .copyWith(color: AppColor.midGrayColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
          );
        }).toList(),
      ),
    ));
  }
}

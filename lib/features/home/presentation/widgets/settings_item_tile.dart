import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/features/home/model/data/settings_model_list.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/constant.dart';

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
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        landingScreen,
                        (route) => false,
                      );
                    },
                    child: Text(
                      item.title,
                      style: AppStyles.styleMedium19
                          .copyWith(color: AppColor.redColor),
                    ),
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

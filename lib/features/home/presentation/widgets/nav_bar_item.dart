import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:smile_chat/features/home/presentation/screens/calls_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/chat_screen.dart';
import 'package:smile_chat/features/home/presentation/screens/contacts_screen.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_images.dart';

class NavBarItem {
  static List<PersistentBottomNavBarItem> navBarItems = [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesChatIcon),
      activeColorPrimary: AppColor.primaryColor,
      activeColorSecondary: AppColor.primaryColor,
      inactiveColorPrimary: AppColor.whiteColor,
      inactiveColorSecondary: AppColor.whiteColor,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesContactIcon),
      activeColorPrimary: AppColor.primaryColor,
      activeColorSecondary: AppColor.primaryColor,
      inactiveColorPrimary: AppColor.whiteColor,
      inactiveColorSecondary: AppColor.whiteColor,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesCallIcon),
      activeColorPrimary: AppColor.primaryColor,
      activeColorSecondary: AppColor.primaryColor,
      inactiveColorPrimary: AppColor.whiteColor,
      inactiveColorSecondary: AppColor.whiteColor,
    ),
  ];

  static List<Widget> screens = const [
    ChatScreen(),
    ContactsScreen(),
    CallsScreen(),
  ];
}

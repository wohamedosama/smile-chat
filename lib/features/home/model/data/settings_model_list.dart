import 'package:smile_chat/features/home/model/settings_model.dart';
import 'package:smile_chat/utils/app_images.dart';

const List<SettingsModel> settingsItemList = [
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

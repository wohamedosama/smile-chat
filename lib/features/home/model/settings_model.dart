class SettingsModel {
  final String image, title;
  final String? subTitle;
  const SettingsModel({
    required this.image,
    required this.title,
    this.subTitle,
  });
}

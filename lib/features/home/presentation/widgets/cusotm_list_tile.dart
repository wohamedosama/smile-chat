import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_svg_image.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.radius = 28,
    this.backgroundColor = AppColor.primaryColor,
    required this.text,
    required this.imagePath,
    this.height = 30,
  });
  final double? radius;
  final Color? backgroundColor;
  final double height;
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: CustomSVGImage(height: height, imagePath: imagePath),
      ),
      title: Text(
        text,
        style: AppStyles.styleMedium20,
      ),
    );
  }
}

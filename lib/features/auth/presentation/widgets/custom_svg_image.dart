// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSVGImage extends StatelessWidget {
  const CustomSVGImage({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.height = 60,
    this.colorFilter,
  });
  final String imagePath;
  final BoxFit? fit;
  final ColorFilter? colorFilter;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      colorFilter: colorFilter,
      height: height,
      fit: fit!,
    );
  }
}

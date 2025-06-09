// ignore: file_names
import 'package:flutter/material.dart';

class CustomSVGImage extends StatelessWidget {
  const CustomSVGImage({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.height = 60,
  });
  final String imagePath;
  final BoxFit? fit;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, fit: fit, height: height);
  }
}

// ignore: file_names
import 'package:flutter/material.dart';

class CustomPNGImage extends StatelessWidget {
  const CustomPNGImage({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.height,
  });
  final String imagePath;
  final BoxFit? fit;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, fit: fit, height: height);
  }
}

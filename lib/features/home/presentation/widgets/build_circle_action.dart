import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildCircleAction extends StatelessWidget {
  const BuildCircleAction({
    super.key,
    required this.onTap,
    required this.color,
    required this.iconAsset,
  });
  final VoidCallback onTap;
  final Color color;
  final String iconAsset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: SvgPicture.asset(
            fit: BoxFit.cover,
            iconAsset,
            width: 36,
            height: 36,
          ),
        ),
      ),
    );
  }
}

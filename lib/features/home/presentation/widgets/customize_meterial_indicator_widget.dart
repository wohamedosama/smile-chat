import 'dart:math' as math;

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomizeMeterialIndicator extends StatelessWidget {
  const CustomizeMeterialIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });
  final Widget child;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      backgroundColor: AppColor.whiteColor,
      displacement: 50.0,
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircularProgressIndicator(
            color: AppColor.deepPurbleColor,
            value: controller.state.isLoading
                ? null
                : math.min(controller.value, 1.0),
          ),
        );
      },
      onRefresh: onRefresh,
      child: child,
    );
  }
}

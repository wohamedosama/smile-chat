import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:smile_chat/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      backgroundColor: AppColor.primaryColor,
    );
  }
}

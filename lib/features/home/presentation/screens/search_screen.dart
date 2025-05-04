import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomHomeScreenAppBar(),
          ],
        ),
      ),
    );
  }
}

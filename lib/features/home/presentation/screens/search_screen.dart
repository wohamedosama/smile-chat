import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:smile_chat/utils/app_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

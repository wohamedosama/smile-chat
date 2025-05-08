import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item_container.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text('contacts', style: AppStyles.styleBold20),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const ChatItemContainer(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_SVG_image.dart';
import 'package:smile_chat/features/home/model/data/chat_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_contact_app_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_contact_container.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                CustomContactsAppBar(
                  title: 'Select contact',
                  subTite: '65 contacts',
                  isSubTitle: true,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
          CustomContactsContainer()
        ],
      ),
    );
  }
}

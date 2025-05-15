import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/screens/contacts_screen.dart';
import 'package:smile_chat/features/home/presentation/widgets/cusotm_list_tile.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class NewContactsAndNewGroupIcons extends StatelessWidget {
  const NewContactsAndNewGroupIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 18,
      children: [
        const CustomListTile(
            text: 'New group', imagePath: Assets.assetsImagesNewGroup),
        const CustomListTile(
            text: 'New Contact', imagePath: Assets.assetsImagesNewContact),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'Contacts on smile chat',
            style: AppStyles.styleMedium20,
          ),
        ),
      ],
    );
  }
}

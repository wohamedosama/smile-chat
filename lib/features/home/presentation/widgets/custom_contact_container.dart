import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/data/chat_model_list.dart';
import 'package:smile_chat/features/home/presentation/screens/contacts_screen.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item.dart';
import 'package:smile_chat/features/home/presentation/widgets/new_contacts_and_new_group_icons.dart';
import 'package:smile_chat/utils/app_color.dart';

class CustomContactsContainer extends StatelessWidget {
  const CustomContactsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: AppColor.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const NewContactsAndNewGroupIcons(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      ChatItem(model: model[index]),
                  itemCount: model.length,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

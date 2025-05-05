import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/data/chat_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/chat_item.dart';
import 'package:smile_chat/utils/app_color.dart';

class ChatItemContainer extends StatelessWidget {
  const ChatItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: AppColor.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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

import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/data/calls_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/call_history_list_tile.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomCallContainer extends StatelessWidget {
  const CustomCallContainer({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Recent',
                  style: AppStyles.styleMedium20,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) => CallHistoryListTile(
                    profileImage: callModel[index].profileImage,
                    title: callModel[index].title,
                    subtitle: callModel[index].subtitle,
                    typeOfCall: callModel[index].typeOfCall,
                  ),
                  itemCount: callModel.length,
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

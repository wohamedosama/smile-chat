import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_chat/features/home/model/calls_model.dart';
import 'package:smile_chat/features/home/model/data/calls_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/call_history_list_tile.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_call_container.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_contact_app_bar.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

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
              children: [
                SizedBox(height: 40),
                CustomContactsAppBar(title: 'Calls'),
                SizedBox(height: 25),
              ],
            ),
          ),
          CustomCallContainer()
        ],
      ),
    );
  }
}

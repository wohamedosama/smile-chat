import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/stories_list_view.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';
import 'package:smile_chat/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomHomeScreenAppBar(
                onPressed: () => Navigator.pushNamed(context, searchScreen)),
            const SizedBox(height: 24),
            const StoriesListView(),
            const SizedBox(height: 30),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: AppColor.whiteColor,
                  //  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColor.primaryColor,
                                child: Image.asset(
                                  Assets.assetsImagesPerson6,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              title: Text('Theresa Webb',
                                  style: AppStyles.styleMedium20),
                              subtitle: Text('How are you today?',
                                  style: AppStyles.styleBold12),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '2 min ago',
                                    style: AppStyles.styleExtraBold12,
                                  ),
                                  const SizedBox(height: 12),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      const SizedBox(
                                          height: 20), // space for badge
                                      Positioned(
                                        top: -8,
                                        right: -2,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text('3',
                                              style: AppStyles.styleExtraBold12
                                                  .copyWith(
                                                      color:
                                                          AppColor.whiteColor)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(height: 4),
                                ],
                              ),
                            );
                          },
                          itemCount: 17,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

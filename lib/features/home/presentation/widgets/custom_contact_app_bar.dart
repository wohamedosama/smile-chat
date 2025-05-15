import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CustomContactsAppBar extends StatelessWidget {
  const CustomContactsAppBar({
    super.key,
    required this.title,
    this.subTite,
    this.onPressedSearchIcon,
    this.onPressedTripleDotsIcons,
    this.isSubTitle = false,
  });
  final String title;
  final String? subTite;
  final bool isSubTitle;
  final void Function()? onPressedSearchIcon;
  final void Function()? onPressedTripleDotsIcons;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppStyles.styleMedium20
                    .copyWith(color: AppColor.whiteColor)),
            const SizedBox(height: 2),
            isSubTitle
                ? Text(subTite!, style: AppStyles.styleSemiBold14)
                : Container(),
          ],
        ),
        const Spacer(),
        CustomIconButton(
          onPressed: onPressedSearchIcon,
          icon: const Icon(
            size: 28,
            Icons.search_outlined,
            color: AppColor.whiteColor,
          ),
        ),
        CustomIconButton(
          onPressed: onPressedTripleDotsIcons,
          icon: Transform.rotate(
            angle: -1.57079633,
            child: const Icon(
              size: 28,
              Icons.more_horiz,
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

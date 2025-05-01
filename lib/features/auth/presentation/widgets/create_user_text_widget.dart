import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class CreateUserTextWidget extends StatelessWidget {
  const CreateUserTextWidget({
    this.onPressed,
    super.key,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          textModel: TextModel(
              text: 'Create user ?',
              style: AppStyles.styleSemiBold16
                  .copyWith(color: AppColor.speicalGray)),
        ),
        CustomTextButton(
          text: 'Register',
          style: AppStyles.styleSemiBold16,
          onPressed: onPressed,
        ),
      ],
    );
  }
}

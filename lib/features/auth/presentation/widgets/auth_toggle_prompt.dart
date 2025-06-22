import 'package:flutter/material.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';

class AuthTogglePrompt extends StatelessWidget {
  const AuthTogglePrompt({
    this.pressToNaviagateToLoginScreen,
    super.key,
    required this.customTextwidgetText,
    required this.customTextButtonText,
  });
  final void Function()? pressToNaviagateToLoginScreen;
  final String customTextwidgetText;
  final String customTextButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          textModel: TextModel(
              text: customTextwidgetText,
              style: AppStyles.styleSemiBold16
                  .copyWith(color: AppColor.speicalGray)),
        ),
        CustomTextButton(
          text: customTextButtonText,
          style: AppStyles.styleSemiBold16,
          onPressed: pressToNaviagateToLoginScreen,
        ),
      ],
    );
  }
}

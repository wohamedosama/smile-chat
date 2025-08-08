import 'package:flutter/material.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_divider.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            //! we will try in the future handle the login using mobile id
            //isDisabled: true,
            backgroundColor: AppColor.darkGrayColor,
            onLongPress: () => _showAlertDialog(context),
            onPressed: () => _showAlertDialog(context),
            //   Navigator.pushNamed(context, loginUsingMobileNumber),
            text: 'Mobile number'),
        const CustomDivider(),
        CustomElevatedButton(
            onPressed: () => Navigator.pushNamed(context, loginUsingEmail),
            text: 'Email id'),
        const SizedBox(height: 47),
      ],
    );
  }

  Future<dynamic> _showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          title: const Text('Coming soon'),
          content: const Text('This feature will be available in the future!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

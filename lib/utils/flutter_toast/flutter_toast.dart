import 'package:flutter/material.dart' show Color, Colors;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smile_chat/utils/app_color.dart';

class MyToast {
  static void showToast({
    required String message,
    required ToastState state,
  }) {
    Fluttertoast.showToast(
        msg: message.toString(),
        backgroundColor: choseToastColor(
          state: state,
        ),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: AppColor.whiteColor);
  }
}

enum ToastState { success, failed, warning }

Color choseToastColor({ToastState? state}) {
  Color color;
  switch (state!) {
    case ToastState.warning:
      color = AppColor.lightYellowColor;
      break;
    case ToastState.success:
      color = AppColor.greenColor;
      break;

    case ToastState.failed:
      color = Colors.red;
      break;
  }
  return color;
}

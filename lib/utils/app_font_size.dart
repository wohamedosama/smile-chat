import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_color.dart';

abstract class AppStyles {
  static TextStyle styleRegular16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: AppColor.blackColor,
  );

  static TextStyle styleBold16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    color: Color(0XFF4EB7F2),
  );

  static TextStyle styleMediumWithWhiteColor16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static TextStyle styleMediumWithLightBlueColor16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.lightBlueColor,
  );
  static TextStyle styleMediumWithBlackColor16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );

  static TextStyle styleMedium19 = const TextStyle(
    fontSize: 19,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static TextStyle styleMedium20 = const TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.darkerBlackColor,
  );
  static TextStyle stylelight16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: Color(0XFFCCCCCC),
  );
  static TextStyle stylelightWithLightPurbleColor16 = const TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: AppColor.lightPurbleColor);

  static TextStyle styleMediam14 = const TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static TextStyle styleRegular14 = const TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: Color(0XFFC0CECC),
  );
  static TextStyle styleSemiBold14 = const TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Color(0XFFB9C1BE),
  );
  static TextStyle styleBold12 = const TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    color: AppColor.midGrayColor,
  );
  static TextStyle styleBold22 = const TextStyle(
    fontSize: 22,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    color: AppColor.darkerBlackColor,
  );
  static TextStyle styleBold20 = const TextStyle(
    fontSize: 22,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColor.whiteColor,
  );
  static TextStyle styleExtraBold12 = const TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    color: AppColor.midGrayColor,
  );

  //! Logout Button

  static TextStyle styleMedium16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.redColor,
  );
  static TextStyle styleMediumWithMidGrayColor16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.midGrayColor,
  );

  static TextStyle styleSemiBoldwhiteColor45 = const TextStyle(
    fontSize: 45,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColor.whiteColor,
  );
  static TextStyle styleSemiBoldBlackColor45 = const TextStyle(
    fontSize: 45,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColor.blackColor,
  );

  static TextStyle styleSemiBold16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    color: AppColor.whiteColor,
  );
  static TextStyle styleSemiBold12 = const TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Color(0XFFCCCCCC),
  );

  // static TextStyle styleSemiBold20 = TextStyle(
  //   fontSize: 20,
  //   fontFamily: 'Poppins',
  //   fontWeight: FontWeight.w600,
  //   color: const Color(0XFF064061),
  // );

  // static TextStyle styleRegular12 = TextStyle(
  //   fontSize: 12,
  //   fontFamily: 'Poppins',
  //   fontWeight: FontWeight.w400,
  //   color: const Color(0XFFAAAAAA),
  // );

  // static TextStyle styleSemiBold24 = TextStyle(
  //   fontSize: 24,
  //   fontFamily: 'Poppins',
  //   fontWeight: FontWeight.w600,
  //   color: const Color(0XFF4EB7F2),
  // );
}

/*double getRepsonsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double respositveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return respositveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // ! var dispatcher = PlatformDispatcher.instance;
  // ! var physical = dispatcher.views.first.physicalSize.width;
  // ! var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // ! double width = physical / devicePixelRatio;
  double width = MediaQuery.of(context).size.width;
  if (width < 1200) {
    return width / 900;
  } else if (width < 1600) {
    return width / 1200;
  } else {
    return width / 1600;
  }
}
*/

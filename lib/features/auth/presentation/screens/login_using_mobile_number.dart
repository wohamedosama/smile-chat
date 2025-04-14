import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_images.dart';

class LoginUsingMobileNumber extends StatelessWidget {
  const LoginUsingMobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primayColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      height: 50,
                      Assets.assetsImagesArrowBackIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      Assets.assetsImagesLogo,
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
/** Container(
          decoration: ShapeDecoration(
              color: AppColor.tr,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(22))),
        ), */

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:smile_chat/features/auth/data/text_model.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_png_image.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/enter_mobile_number_text_field.dart';
import 'package:smile_chat/features/auth/presentation/widgets/terms_and_conditions_list.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';
import 'package:smile_chat/utils/constant.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class LoginUsingMobileNumber extends StatelessWidget {
  LoginUsingMobileNumber({
    super.key,
    this.phoneNumber = '',
  });
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhonsAuthLoading) {
          const Center(
              child: CircularProgressIndicator(
            color: AppColor.redColor,
          ));
        } else if (state is PhonsAuthError) {
          MyToast.showToast(
              message: state.error.toString(), state: ToastState.failed);
        } else if (state is PhonsNumberSumbitted) {
          MyToast.showToast(
              message: 'OTP Sent Success', state: ToastState.success);
          const Duration(seconds: 2);
          Navigator.of(context).pushNamed(getOTPScreen, arguments: phoneNumber);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        resizeToAvoidBottomInset: true,
        body: Form(
          key: fromKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 22),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomAppBar(
                          isThatContainImage: true,
                        ),
                        const SizedBox(height: 30),
                        CustomTextWidget(
                          textModel: TextModel(
                            text: 'Hello!',
                            style: AppStyles.styleSemiBoldwhiteColor45,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextWidget(
                          textModel: TextModel(
                            text:
                                'we are requesting your mobile number just to enter our platform for login purpose.',
                            style: AppStyles.styleRegular16
                                .copyWith(color: AppColor.whiteColor),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const CustomPNGImage(
                            imagePath: Assets.assetsImagesPhoneAuthImage),
                        const SizedBox(height: 20),
                        EnterMobileNumberTextField(
                          phoneNumber: phoneNumber,
                        ),
                        const SizedBox(height: 35),
                        CustomElevatedButton(
                          onPressed: () {
                            if (!fromKey.currentState!.validate()) {
                              Navigator.pop(context);
                            } else {
                              fromKey.currentState!.save();
                              BlocProvider.of<PhoneAuthCubit>(context)
                                  .submitPhoneNumber(phoneNumber);
                            }
                          },
                          text: 'Get OTP',
                        ),
                        const SizedBox(height: 40),
                        const TermsAndConditionsWidget(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

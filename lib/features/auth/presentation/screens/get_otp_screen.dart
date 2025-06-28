// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/otp_input_instructions.dart';
import 'package:smile_chat/features/auth/presentation/widgets/pin_code_widget.dart';
import 'package:smile_chat/features/auth/presentation/widgets/you_didnot_receive_code_text_widget.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class GETOTPScereen extends StatelessWidget {
  GETOTPScereen({
    super.key,
    required this.phoneNumber,
    this.otpCode = '',
  });
  final dynamic phoneNumber;
  late String otpCode;

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
            color: AppColor.primaryColor,
          ));
        } else if (state is PhonsAuthError) {
          MyToast.showToast(
              message: state.error.toString(), state: ToastState.failed);
        } else if (state is PhonsOTPVerified) {
          MyToast.showToast(
              message: 'Login Success', state: ToastState.success);
          const Duration(seconds: 2);
          Navigator.of(context).pushReplacementNamed(homeScreen);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const CustomAppBar(isThatContainImage: false),
                const SizedBox(height: 40),
                OTPInputInstructions(
                  phoneNumber: phoneNumber,
                ),
                const Spacer(),
                PinCodeWidget(phoneNumber: phoneNumber),
                const Spacer(flex: 2),
                const YouDidnotReceiveCodeTextWidget(),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<PhoneAuthCubit>(context)
                              .submitOTP(otpCode);
                        },
                        text: 'Continue'),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

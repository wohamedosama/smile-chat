// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_circle_progress_indicator.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_elevated_button.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/constant.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();

    return BlocConsumer<EmailAuthCubit, EmailAuthState>(
      listener: (context, state) async {
        if (state is ResetPasswordUsingEmailSuccessState) {
          print('✅ Mail sent successfully');
          const Duration(seconds: 7);
          MyToast.showToast(
              message: 'Mail sent successfully', state: ToastState.success);
          Navigator.popAndPushNamed(context, loginUsingEmail);
        } else if (state is ResetPasswordUsingEmailFailureState) {
          print('❌ We faced an error while sent email : ${state.errorMessage}');
          MyToast.showToast(
              message: state.errorMessage.toString(), state: ToastState.failed);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const CustomAppBar(
                      isThatContainImage: true, isTheColorBlack: true),
                  Text(
                      "Don’t worry! It happens.\nPlease enter your email to receive a reset link.",
                      style: AppStyles.styleMediumWithBlackColor16),
                  const SizedBox(height: 32),
                  EnterYourEmailFormField(emailController: email),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<EmailAuthCubit>(context)
                              .resetPassword(email.text.trim());
                        }
                      },
                      text: "Send Reset Link",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "We’ll send a reset link to your email.",
                      style: AppStyles.styleMediam14,
                    ),
                  ),
                  if (state is LoginUsingEmailLoadingState)
                    const CustomCircleProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class EnterYourEmailFormField extends StatelessWidget {
  const EnterYourEmailFormField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value.trim())) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        filled: false,
        fillColor: AppColor.lightGrayColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

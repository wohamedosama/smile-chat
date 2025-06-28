// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_circle_progress_indicator.dart';
import 'package:smile_chat/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/email_and_password_login_form_fields.dart';
import 'package:smile_chat/features/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/login_button_and_create_user_text_button.dart';
import 'package:smile_chat/features/landing/presentation/widgets/custom_divider.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/constant.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({
    super.key,
  });
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailAuthCubit, EmailAuthState>(
      listener: (context, state) {
        if (state is LoginUsingEmailSuccessState) {
          print('✅ Welcome ');
          MyToast.showToast(message: 'Welcome', state: ToastState.success);
          const Duration(seconds: 2);
          Navigator.pushReplacementNamed(context, homeScreen);
        } else if (state is LoginUsingEmailFailureState) {
          print('❌ Login failed: ${state.errorMessage}');
          MyToast.showToast(
              message: state.errorMessage.toString(), state: ToastState.failed);
        } else if (state is LoginUsingGoogleSuccessState) {
          print('✅ Welcome via Google');
          //String userName = state.user?.displayName ?? 'User';
          MyToast.showToast(message: 'Welcome ', state: ToastState.success);
          const Duration(seconds: 2);
          Navigator.pushReplacementNamed(context, homeScreen);
        } else if (state is LoginUsingGoogleFailureState) {
          print('❌ Google Login failed: ${state.errorMessage}');
          MyToast.showToast(
              message: state.errorMessage, state: ToastState.failed);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: AppColor.deepPurbleColor,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //! login using google button
                      CustomIconButton(
                        onPressed: (state is LoginUsingGoogleLoadingState)
                            ? null // Disable button when loading
                            : () {
                                BlocProvider.of<EmailAuthCubit>(context)
                                    .signInWithGoogle();
                              },
                      ),
                      const SizedBox(height: 40),
                      CustomDivider(style: AppStyles.styleExtraBold16),
                      const SizedBox(height: 40),
                      EmailAndPasswordLoginFormFields(
                          email: email, password: password),
                      ForgetPasswordTextButton(
                        pressToNavigateToForgetPasswordScreen: () {
                          Navigator.pushNamed(context, forgetPasswordScreen);
                        },
                      ),
                      const SizedBox(height: 50),
                      LoginButtonAndCreateUserTextButton(
                        text: state is LoginUsingEmailLoadingState
                            ? 'Loading'
                            : 'Log In',
                        customTextButtonText: 'Register',
                        customTextwidgetText: 'Create user ?',
                        onPressedRegisterButton: () {
                          Navigator.pushReplacementNamed(
                              context, registerScreen);
                        },
                        clickToNavigateToHomeScreen: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<EmailAuthCubit>(context)
                                .loginUsingMail(
                                    email: email.text.trim(),
                                    password: password.text);
                          }
                          password.clear();
                        },
                      ),
                      if (state is LoginUsingEmailLoadingState ||
                          state is LoginUsingGoogleLoadingState)
                        const CustomCircleProgressIndicator()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

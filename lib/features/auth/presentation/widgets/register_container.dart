// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/widgets/create_an_account_and_already_a_user_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/constant.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class RegisterContainer extends StatelessWidget {
  RegisterContainer({
    super.key,
  });
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailAuthCubit, EmailAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is CreateNewUserUsingEmailLoadingState) {
          const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        if (state is CreateNewUserUsingEmailFailureState) {
          print('❌ Registration failed: ${state.errorMessage}');
          MyToast.showToast(
              message: state.errorMessage.toString(), state: ToastState.failed);
        } else if (state is CreateNewUserUsingEmailSuccessState) {
          print('✅ User Created successful');
          MyToast.showToast(
              message: 'User Created Successful', state: ToastState.success);
          const Duration(seconds: 2);
          Navigator.pushNamed(context, loginUsingEmail);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              color: AppColor.deepPurbleColor,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 14),
                      Column(
                        spacing: 40,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFromField(
                            labelText: 'Your Name',
                            controller: userName,
                          ),
                          CustomTextFromField(
                            labelText: 'Your email',
                            controller: email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                          CustomTextFromField(
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 6) {
                                return 'Password should be at least 6 characters';
                              }
                              return null;
                            },
                            labelText: 'Password',
                            controller: password,
                          ),
                          CustomTextFromField(
                              controller: confirmPassword,
                              labelText: 'Confirm Password'),
                        ],
                      ),
                      // CustomColumnContainOfCustomTextFormFieldInTheRegisterScreen(
                      //   emailController: email,
                      //   passwordController: password,
                      // ),
                      const SizedBox(height: 50),
                      CreateAnAccountAndAlreadyAUserTextButton(
                        customTextButtonText: 'Sign in',
                        customTextwidgetText: 'Already a user ?',
                        text: state is CreateNewUserUsingEmailLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              )).toString()
                            : 'Create an account',
                        onPressedRegisterButton: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<EmailAuthCubit>(context)
                                .createNewUser(
                              userName.text.trim(),
                              email.text.trim(),
                              password.text.trim(),
                              confirmPassword.text.trim(),
                            );
                          }
                        },
                      ),
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

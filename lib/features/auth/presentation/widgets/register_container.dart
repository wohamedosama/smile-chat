// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/widgets/create_an_account_and_already_a_user_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/register_form_fields.dart';
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
      listener: (context, state) async {
        if (state is CreateNewUserUsingEmailSuccessState) {
          print('✅ User Created successful');
          MyToast.showToast(
              message: 'User Created Successful', state: ToastState.success);

          await Future.delayed(const Duration(milliseconds: 500));
          Navigator.pushReplacementNamed(context, loginUsingEmail);
        } else if (state is CreateNewUserUsingEmailFailureState) {
          print('❌ Registration failed: ${state.errorMessage}');
          MyToast.showToast(
              message: state.errorMessage.toString(), state: ToastState.failed);
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
                      RegisterFromFields(
                        userName: userName,
                        email: email,
                        password: password,
                        confirmPassword: confirmPassword,
                      ),
                      const SizedBox(height: 50),
                      CreateAnAccountAndAlreadyAUserTextButton(
                        pressToNaviagateToLoginScreen: () =>
                            Navigator.of(context)
                                .pushReplacementNamed(loginUsingEmail),
                        customTextButtonText: 'Sign in',
                        customTextwidgetText: 'Already a user ?',
                        text: 'Create an account',
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

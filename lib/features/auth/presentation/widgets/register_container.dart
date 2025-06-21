// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/auth/presentation/widgets/create_an_account_and_already_a_user_text_button.dart';
import 'package:smile_chat/features/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/flutter_toast/flutter_toast.dart';

class RegisterContainer extends StatelessWidget {
  RegisterContainer({
    super.key,
  });
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
          //  Navigator.pushNamed(context, loginUsingEmail);
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
                          const CustomTextFromField(
                            labelText: 'Your Name',
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
                          const CustomTextFromField(
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
                                    email.text.trim(), password.text.trim());
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

// ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';

// class RegisterContainer extends StatefulWidget {
//   const RegisterContainer({super.key});

//   @override
//   State<RegisterContainer> createState() => _RegisterContainerState();
// }

// class _RegisterContainerState extends State<RegisterContainer> {
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<EmailAuthCubit, EmailAuthState>(
//       listener: (context, state) {
//         print(
//             '🔔 BlocConsumer listener called with state: ${state.runtimeType}');

//         if (state is CreateNewUserUsingEmailFailureState) {
//           print('❌ Registration failed: ${state.errorMessage}');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Error: ${state.errorMessage}')),
//           );
//         } else if (state is CreateNewUserUsingEmailSuccessState) {
//           print('✅ Registration successful');
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Registration successful!')),
//           );
//         }
//       },
//       builder: (context, state) {
//         print(
//             '🏗️ BlocConsumer builder called with state: ${state.runtimeType}');

//         return Expanded(
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             child: Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: email,
//                     decoration: const InputDecoration(labelText: 'Email'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Email is required';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: password,
//                     decoration: const InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 40),
//                   ElevatedButton(
//                     onPressed: state is CreateNewUserUsingEmailLoadingState
//                         ? null
//                         : () {
//                             print('🔘 REGISTER BUTTON PRESSED');

//                             if (formkey.currentState!.validate()) {
//                               print('✅ Form validated successfully');
//                               print('📧 Email: "${email.text}"');
//                               print(
//                                   '🔑 Password length: ${password.text.length}');

//                               // Direct call to test
//                               context.read<EmailAuthCubit>().createNewUser(
//                                     email.text.trim(),
//                                     password.text,
//                                   );
//                             } else {
//                               print('❌ Form validation failed');
//                             }
//                           },
//                     child: state is CreateNewUserUsingEmailLoadingState
//                         ? const CircularProgressIndicator()
//                         : const Text('Register'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }
// }

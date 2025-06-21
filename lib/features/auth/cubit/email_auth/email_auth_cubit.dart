// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smile_chat/utils/firebase_error_text/firebase_error_text.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit() : super(EmailAuthInitial());

  bool isPasswordConfimred(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  Future<void> createNewUser(
    String userName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      emit(CreateNewUserUsingEmailLoadingState());

      if (!isPasswordConfimred(password, confirmPassword)) {
        emit(CreateNewUserUsingEmailFailureState(
          errorMessage: 'Password do not match',
        ));
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(CreateNewUserUsingEmailSuccessState());
    } catch (error) {
      print('❌ Error occurred: $error');
      emit(CreateNewUserUsingEmailFailureState(
          errorMessage: FirebaseErrorUtils.getRegistrationErrorMessage(
              error.toString())));
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(LogoutSuccessStata());
    } catch (error) {
      emit(LogoutFailurestate(errorMessge: error.toString()));
    }
  }
}

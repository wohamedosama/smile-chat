// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit() : super(EmailAuthInitial());

  Future<void> createNewUser(String email, String password) async {
    try {
      emit(CreateNewUserUsingEmailLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('✅ Firebase user created: ${credential.user?.email}');
      emit(CreateNewUserUsingEmailSuccessState());
    } catch (error) {
      print('❌ Error occurred: $error');
      emit(CreateNewUserUsingEmailFailureState(errorMessage: error.toString()));
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

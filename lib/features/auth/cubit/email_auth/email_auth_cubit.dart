// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smile_chat/utils/firebase_error_text/firebase_error_text.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit() : super(const EmailAuthState());
//? don't forget add visible your password and toogle between shown password or not
  bool isPasswordConfimred(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  bool validateUsername(String username) {
    if (username.trim().isEmpty) {
      return false;
    }
    if (username.trim().length < 2) {
      return false;
    }
    final validUsernameRegex = RegExp(r'^[a-zA-Z0-9_-]+$');
    return validUsernameRegex.hasMatch(username.trim());
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email.trim());
  }

  bool validatePassword(String password) {
    return password.length >= 6;
  }

  Future<void> createNewUser(
    String userName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      emit(state.copyWith(
        isCreateNewUserUsingEmailLoading: true,
        isCreateNewUserUsingEmailSuccess: false,
      ));

      if (!validateUsername(userName)) {
        emit(state.copyWith(
          isCreateNewUserUsingEmailLoading: false,
          isCreateNewUserUsingEmailFailure:
              'Username must be at least 2 characters and contain only letters, numbers, underscore, or hyphen',
        ));
        return;
      }

      if (!validateEmail(email)) {
        emit(state.copyWith(
          isCreateNewUserUsingEmailLoading: false,
          isCreateNewUserUsingEmailFailure:
              FirebaseErrorUtils.getRegistrationErrorMessage('invalid-email'),
        ));
        return;
      }
      if (!validatePassword(password)) {
        emit(state.copyWith(
          isCreateNewUserUsingEmailLoading: false,
          isCreateNewUserUsingEmailFailure:
              FirebaseErrorUtils.getRegistrationErrorMessage('weak-password'),
        ));
        return;
      }

      // Validate password confirmation
      if (!isPasswordConfimred(password, confirmPassword)) {
        emit(state.copyWith(
          isCreateNewUserUsingEmailLoading: false,
          isCreateNewUserUsingEmailFailure: 'Passwords do not match',
        ));
        return;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      emit(state.copyWith(
        isCreateNewUserUsingEmailLoading: false,
        isCreateNewUserUsingEmailSuccess: true,
      ));
    } on FirebaseAuthException catch (error) {
      String errorMessage =
          FirebaseErrorUtils.getRegistrationErrorMessage(error.code);
      print('❌ Firebase Auth Error: ${error.code} - ${error.message}');
      emit(state.copyWith(
        isCreateNewUserUsingEmailLoading: false,
        isCreateNewUserUsingEmailFailure: errorMessage,
      ));
    } catch (error) {
      print('❌ Unexpected error occurred: $error');
      emit(state.copyWith(
        isCreateNewUserUsingEmailLoading: false,
        isCreateNewUserUsingEmailFailure:
            FirebaseErrorUtils.getRegistrationErrorMessage('internal-error'),
      ));
    }
  }

  Future<void> loginUsingMail(
      {required String email, required String password}) async {
    try {
      emit(state.copyWith(
        isLoginUsingEmailLoading: true,
        isLoginUsingEmailSuccess: false,
      ));

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(state.copyWith(
        isLoginUsingEmailLoading: false,
        isLoginUsingEmailSuccess: true,
      ));
    } on FirebaseAuthException catch (error) {
      print('❌ Firebase Auth Error: ${error.code} - ${error.message}');
      emit(state.copyWith(
        isLoginUsingEmailLoading: false,
        isLoginUsingEmailSuccess: true,
      ));
    } catch (error) {
      print('❌ Unexpected error occurred: $error');
      emit(state.copyWith(
        isLoginUsingEmailLoading: false,
        isLoginUsingEmailFailure:
            FirebaseErrorUtils.getSignInErrorMessage('internal-error'),
      ));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(state.copyWith(
        isResetPasswordUsingEmailLoading: true,
        isResetPasswordUsingEmailSuccess: false,
      ));
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(state.copyWith(
        isResetPasswordUsingEmailLoading: false,
        isResetPasswordUsingEmailSuccess: true,
      ));
    } on FirebaseAuthException catch (error) {
      String errorMessage =
          FirebaseErrorUtils.getPasswordResetErrorMessage(error.code);
      print('❌ Firebase Auth Error: ${error.code} - ${error.message}');
      emit(state.copyWith(
        isResetPasswordUsingEmailLoading: false,
        isResetPasswordUsingEmailFailure: errorMessage,
      ));
    } catch (error) {
      print('❌ Unexpected error occurred: $error');
      emit(state.copyWith(
        isResetPasswordUsingEmailLoading: false,
        isResetPasswordUsingEmailFailure:
            FirebaseErrorUtils.getPasswordResetErrorMessage('internal-error'),
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(
        isLoginUsingGoogleLoading: true,
        isLoginUsingGoogleSuccess: false,
      ));
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(state.copyWith(
          isLoginUsingGoogleLoading: false,
          isLoginUsingGoogleFailure: 'Sign in was cancelled by user',
        ));

        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        emit(state.copyWith(
          isLoginUsingGoogleLoading: false,
          isLoginUsingGoogleFailure: 'Failed to obtain authentication details',
        ));
        return;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(state.copyWith(
          isLoginUsingGoogleLoading: false,
          isLoginUsingGoogleSuccess: true,
          isEmailVerified: true,
        ));
      } else {
        emit(state.copyWith(
          isLoginUsingGoogleLoading: false,
          isLoginUsingGoogleFailure: 'Failed to sign in with Google',
        ));
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth specific errors
      String errorMessage = FirebaseErrorUtils.getSignInErrorMessage(e.code);
      emit(state.copyWith(
        isLoginUsingGoogleLoading: false,
        isLoginUsingGoogleFailure: errorMessage,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoginUsingGoogleLoading: false,
        isLoginUsingGoogleFailure:
            'An unexpected error occurred: ${e.toString()}',
      ));
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      emit(const EmailAuthState());
    } catch (error) {
      print('❌ Logout error: $error');
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified;
      if (isEmailVerified == true) {
        emit(state.copyWith(
          isEmailVerificationSuccess: true,
          isEmailVerificationLoading: false,
        ));
      } else {
        emit(state.copyWith(
            isEmailVerificationLoading: true,
            isEmailVerificationSuccess: false));
        await FirebaseAuth.instance.currentUser?.sendEmailVerification();
        emit(state.copyWith(
            isEmailVerificationLoading: false,
            isEmailVerificationSuccess: true));
      }
    } on FirebaseAuthException catch (error) {
      print('❌ Firebase Auth Error:  - ${error.message.toString()}');
      emit(
        state.copyWith(
            isEmailVerificationLoading: false,
            isEmailVerificationSuccess: false,
            emailVerificationFailure: error.toString()),
      );
    }
  }
}

// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smile_chat/utils/firebase_error_text/firebase_error_text.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit() : super(EmailAuthInitial());

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
      emit(CreateNewUserUsingEmailLoadingState());

      if (!validateUsername(userName)) {
        emit(CreateNewUserUsingEmailFailureState(
          errorMessage:
              'Username must be at least 2 characters and contain only letters, numbers, underscore, or hyphen',
        ));
        return;
      }

      if (!validateEmail(email)) {
        emit(CreateNewUserUsingEmailFailureState(
          errorMessage:
              FirebaseErrorUtils.getRegistrationErrorMessage('invalid-email'),
        ));
        return;
      }
      if (!validatePassword(password)) {
        emit(CreateNewUserUsingEmailFailureState(
          errorMessage:
              FirebaseErrorUtils.getRegistrationErrorMessage('weak-password'),
        ));
        return; // Important: return to stop execution
      }

      // Validate password confirmation
      if (!isPasswordConfimred(password, confirmPassword)) {
        emit(CreateNewUserUsingEmailFailureState(
          errorMessage: 'Passwords do not match',
        ));
        return; // Important: return to stop execution
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      emit(CreateNewUserUsingEmailSuccessState());
    } on FirebaseAuthException catch (error) {
      String errorMessage =
          FirebaseErrorUtils.getRegistrationErrorMessage(error.code);
      print('❌ Firebase Auth Error: ${error.code} - ${error.message}');
      emit(CreateNewUserUsingEmailFailureState(errorMessage: errorMessage));
    } catch (error) {
      print('❌ Unexpected error occurred: $error');
      emit(CreateNewUserUsingEmailFailureState(
        errorMessage:
            FirebaseErrorUtils.getRegistrationErrorMessage('internal-error'),
      ));
    }
  }

  Future<void> loginUsingMail(
      {required String email, required String password}) async {
    try {
      emit(LoginUsingEmailLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginUsingEmailSuccessState());
    } on FirebaseAuthException catch (error) {
      String errorMessage =
          FirebaseErrorUtils.getSignInErrorMessage(error.code);
      print('❌ Firebase Auth Error: ${error.code} - ${error.message}');
      emit(LoginUsingEmailFailureState(errorMessage: errorMessage));
    } catch (error) {
      print('❌ Unexpected error occurred: $error');
      emit(LoginUsingEmailFailureState(
        errorMessage:
            FirebaseErrorUtils.getSignInErrorMessage('internal-error'),
      ));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(ResetPasswordUsingEmailLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordUsingEmailSuccessState());
    } on FirebaseAuthException catch (error) {
      String errorMessage =
          FirebaseErrorUtils.getPasswordResetErrorMessage(error.code);
      print('❌ Firebase Auth Error: ${error.code} - ${error.message}');
      emit(ResetPasswordUsingEmailFailureState(errorMessage: errorMessage));
    } catch (error) {
      print('❌ Unexpected error occurred: $error');
      emit(ResetPasswordUsingEmailFailureState(
        errorMessage:
            FirebaseErrorUtils.getPasswordResetErrorMessage('internal-error'),
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(LoginUsingGoogleLoadingState());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginUsingGoogleFailureState(
            errorMessage: 'Sign in was cancelled by user'));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        emit(LoginUsingGoogleFailureState(
            errorMessage: 'Failed to obtain authentication details'));
        return;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(LoginUsingGoogleSuccessState());
      } else {
        emit(LoginUsingGoogleFailureState(
            errorMessage: 'Failed to sign in with Google'));
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth specific errors
      String errorMessage = FirebaseErrorUtils.getSignInErrorMessage(e.code);
      emit(LoginUsingGoogleFailureState(errorMessage: errorMessage));
    } catch (e) {
      // Handle any other errors
      emit(LoginUsingGoogleFailureState(
          errorMessage: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      GoogleSignIn().signOut();
      emit(LogoutSuccessStata());
    } catch (error) {
      emit(LogoutFailurestate(errorMessge: error.toString()));
    }
  }
}

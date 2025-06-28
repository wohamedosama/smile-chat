// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());

  late String verificationId;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhonsAuthLoading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 12),
      phoneNumber: '+201149060781',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationFailed(FirebaseAuthException error) {
    print('Verification Failed ${error.toString()}');
    emit(PhonsAuthError(error: error.toString()));
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('Verification Completed');
    await signIn(credential);
  }

  void codeSent(String verificationId, int? resendToken) {
    print('Code Sent Sucessful');
    this.verificationId = verificationId;
    emit(PhonsNumberSumbitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("Code Auto Retrieval Timeout");
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhonsOTPVerified());
    } on FirebaseAuthException catch (error) {
      print('Verification Failed ${error.toString()}');
      emit(PhonsAuthError(error: error.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}

part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhonsAuthLoading extends PhoneAuthState {}

final class PhonsAuthError extends PhoneAuthState {
  final String error;
  PhonsAuthError({required this.error});
}

final class PhonsNumberSumbitted extends PhoneAuthState {}

final class PhonsOTPVerified extends PhoneAuthState {}

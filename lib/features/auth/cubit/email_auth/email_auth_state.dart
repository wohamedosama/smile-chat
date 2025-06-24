part of 'email_auth_cubit.dart';

@immutable
sealed class EmailAuthState {}

final class EmailAuthInitial extends EmailAuthState {}

final class CreateNewUserUsingEmailLoadingState extends EmailAuthState {}

final class CreateNewUserUsingEmailSuccessState extends EmailAuthState {}

final class CreateNewUserUsingEmailFailureState extends EmailAuthState {
  final String errorMessage;
  CreateNewUserUsingEmailFailureState({required this.errorMessage});
}

final class LoginUsingEmailLoadingState extends EmailAuthState {}

final class LoginUsingEmailSuccessState extends EmailAuthState {}

final class LoginUsingEmailFailureState extends EmailAuthState {
  final String errorMessage;
  LoginUsingEmailFailureState({required this.errorMessage});
}

final class ResetPasswordUsingEmailLoadingState extends EmailAuthState {}

final class ResetPasswordUsingEmailSuccessState extends EmailAuthState {}

final class ResetPasswordUsingEmailFailureState extends EmailAuthState {
  final String errorMessage;
  ResetPasswordUsingEmailFailureState({required this.errorMessage});
}

final class LogoutSuccessStata extends EmailAuthState {}

final class LogoutFailurestate extends EmailAuthState {
  final String errorMessge;

  LogoutFailurestate({required this.errorMessge});
}

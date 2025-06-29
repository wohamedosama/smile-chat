part of 'email_auth_cubit.dart';

@immutable
class EmailAuthState extends Equatable {
  final bool? isCreateNewUserUsingEmailLoading;
  final bool? isLoginUsingEmailLoading;
  final bool? isResetPasswordUsingEmailLoading;
  final bool? isLoginUsingGoogleLoading;
  final bool? isCreateNewUserUsingEmailSuccess;
  final bool? isLoginUsingEmailSuccess;
  final bool? isResetPasswordUsingEmailSuccess;
  final bool? isLoginUsingGoogleSuccess;
  final String? isCreateNewUserUsingEmailFailure;
  final String? isLoginUsingEmailFailure;
  final String? isResetPasswordUsingEmailFailure;
  final String? isLoginUsingGoogleFailure;

  const EmailAuthState({
    this.isCreateNewUserUsingEmailLoading = false,
    this.isLoginUsingEmailLoading = false,
    this.isResetPasswordUsingEmailLoading = false,
    this.isLoginUsingGoogleLoading = false,
    this.isCreateNewUserUsingEmailSuccess = false,
    this.isLoginUsingEmailSuccess = false,
    this.isResetPasswordUsingEmailSuccess = false,
    this.isLoginUsingGoogleSuccess = false,
    this.isCreateNewUserUsingEmailFailure,
    this.isLoginUsingEmailFailure,
    this.isResetPasswordUsingEmailFailure,
    this.isLoginUsingGoogleFailure,
  });

  @override
  List<Object?> get props => [
        isCreateNewUserUsingEmailLoading,
        isLoginUsingEmailLoading,
        isResetPasswordUsingEmailLoading,
        isLoginUsingGoogleLoading,
        isCreateNewUserUsingEmailSuccess,
        isLoginUsingEmailSuccess,
        isResetPasswordUsingEmailSuccess,
        isLoginUsingGoogleSuccess,
        isCreateNewUserUsingEmailFailure,
        isLoginUsingEmailFailure,
        isResetPasswordUsingEmailFailure,
        isLoginUsingGoogleFailure,
      ];

  EmailAuthState copyWith({
    bool? isCreateNewUserUsingEmailLoading,
    bool? isLoginUsingEmailLoading,
    bool? isResetPasswordUsingEmailLoading,
    bool? isLoginUsingGoogleLoading,
    bool? isCreateNewUserUsingEmailSuccess,
    bool? isLoginUsingEmailSuccess,
    bool? isResetPasswordUsingEmailSuccess,
    bool? isLoginUsingGoogleSuccess,
    String? isCreateNewUserUsingEmailFailure,
    String? isLoginUsingEmailFailure,
    String? isResetPasswordUsingEmailFailure,
    String? isLoginUsingGoogleFailure,
  }) {
    return EmailAuthState(
      isCreateNewUserUsingEmailLoading: isCreateNewUserUsingEmailLoading ??
          this.isCreateNewUserUsingEmailLoading,
      isLoginUsingEmailLoading:
          isLoginUsingEmailLoading ?? this.isLoginUsingEmailLoading,
      isResetPasswordUsingEmailLoading: isResetPasswordUsingEmailLoading ??
          this.isResetPasswordUsingEmailLoading,
      isLoginUsingGoogleLoading:
          isLoginUsingGoogleLoading ?? this.isLoginUsingGoogleLoading,
      isCreateNewUserUsingEmailSuccess: isCreateNewUserUsingEmailSuccess ??
          this.isCreateNewUserUsingEmailSuccess,
      isLoginUsingEmailSuccess:
          isLoginUsingEmailSuccess ?? this.isLoginUsingEmailSuccess,
      isResetPasswordUsingEmailSuccess: isResetPasswordUsingEmailSuccess ??
          this.isResetPasswordUsingEmailSuccess,
      isLoginUsingGoogleSuccess:
          isLoginUsingGoogleSuccess ?? this.isLoginUsingGoogleSuccess,
      isCreateNewUserUsingEmailFailure: isCreateNewUserUsingEmailFailure,
      isLoginUsingEmailFailure: isLoginUsingEmailFailure,
      isResetPasswordUsingEmailFailure: isResetPasswordUsingEmailFailure,
      isLoginUsingGoogleFailure: isLoginUsingGoogleFailure,
    );
  }
}

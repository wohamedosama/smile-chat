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
  final bool? isEmailVerified;
  final bool? isEmailVerificationSuccess;
  final String? emailVerificationFailure;
  final bool? isEmailVerificationLoading;
  const EmailAuthState({
    this.isEmailVerificationLoading = false,
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
    this.isEmailVerified = false,
    this.isEmailVerificationSuccess = false,
    this.emailVerificationFailure,
  });

  @override
  List<Object?> get props => [
        isEmailVerificationLoading,
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
        isEmailVerified,
        isEmailVerificationSuccess,
        emailVerificationFailure,
      ];

  EmailAuthState copyWith({
    bool? isEmailVerificationLoading,
    bool? isEmailVerified,
    bool? isEmailVerificationSuccess,
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
    String? emailVerificationFailure,
  }) {
    return EmailAuthState(
      isEmailVerificationLoading:
          isEmailVerificationLoading ?? this.isEmailVerificationLoading,
      emailVerificationFailure:
          emailVerificationFailure ?? this.emailVerificationFailure,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isEmailVerificationSuccess:
          isEmailVerificationSuccess ?? this.isEmailVerificationSuccess,
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

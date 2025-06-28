class FirebaseErrorUtils {
  FirebaseErrorUtils._();

  /// Returns user-friendly error messages for Firebase Auth registration errors
  static String getRegistrationErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'The password provided is too weak. Please use a stronger password.';
      case 'email-already-in-use':
        return 'An account already exists with this email address. Please use a different email or try logging in.';
      case 'invalid-email':
        return 'The email address is not valid. Please enter a valid email address.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'too-many-requests':
        return 'Too many unsuccessful attempts. Please try again later.';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'invalid-credential':
        return 'The provided credential is invalid or has expired.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'missing-email':
        return 'Please enter your email address.';
      case 'missing-password':
        return 'Please enter your password.';
      case 'invalid-password':
        return 'The password is invalid. Please enter a valid password.';
      case 'quota-exceeded':
        return 'Service quota exceeded. Please try again later.';
      case 'app-deleted':
        return 'The app has been deleted. Please contact support.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication.';
      case 'keychain-error':
        return 'An error occurred accessing the keychain. Please try again.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      default:
        return 'An error occurred during registration. Please try again.';
    }
  }

  /// Returns user-friendly error messages for Firebase Auth sign-in errors
  static String getSignInErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No account found with this email address. Please check your email or create a new account.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'The email address is not valid. Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';
      case 'too-many-requests':
        return 'Too many unsuccessful login attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'invalid-credential':
        return 'Invalid email or password. Please check your credentials and try again.';
      case 'user-token-expired':
        return 'Your session has expired. Please sign in again.';
      case 'invalid-user-token':
        return 'Your authentication token is invalid. Please sign in again.';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please log in again.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'missing-email':
        return 'Please enter your email address.';
      case 'missing-password':
        return 'Please enter your password.';
      case 'invalid-password':
        return 'The password is invalid. Please enter a valid password.';
      case 'quota-exceeded':
        return 'Service quota exceeded. Please try again later.';
      case 'app-deleted':
        return 'The app has been deleted. Please contact support.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication.';
      case 'keychain-error':
        return 'An error occurred accessing the keychain. Please try again.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or disabled.';
      case 'already-initialized':
        return 'Firebase has already been initialized.';
      default:
        return 'An error occurred during sign in. Please try again.';
    }
  }

  /// Returns user-friendly error messages for Firebase Auth password reset errors
  static String getPasswordResetErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'auth/invalid-email':
        return 'The email address is not valid. Please enter a valid email address.';
      case 'auth/user-not-found':
        return 'No account found with this email address. Please check your email.';
      case 'auth/too-many-requests':
        return 'Too many password reset requests. Please try again later.';
      case 'auth/network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'auth/invalid-continue-uri':
        return 'The continue URL provided is invalid.';
      case 'auth/missing-continue-uri':
        return 'A continue URL must be provided in the request.';
      case 'auth/missing-email':
        return 'Please enter your email address.';
      default:
        return 'An error occurred while sending password reset email. Please try again.';
    }
  }

  /// Returns user-friendly error messages for Firebase Auth email verification errors
  static String getEmailVerificationErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'auth/invalid-email':
        return 'The email address is not valid.';
      case 'auth/user-not-found':
        return 'No user found with this email address.';
      case 'auth/too-many-requests':
        return 'Too many verification emails sent. Please try again later.';
      case 'auth/network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'auth/user-disabled':
        return 'This account has been disabled. Please contact support.';
      default:
        return 'An error occurred while sending verification email. Please try again.';
    }
  }

  /// Returns user-friendly error messages for Firebase Auth profile update errors
  static String getProfileUpdateErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'auth/requires-recent-login':
        return 'This operation requires recent authentication. Please log in again.';
      case 'auth/user-not-found':
        return 'User not found. Please sign in again.';
      case 'auth/invalid-user-token':
        return 'Your authentication token is invalid. Please sign in again.';
      case 'auth/user-token-expired':
        return 'Your session has expired. Please sign in again.';
      case 'auth/network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'auth/too-many-requests':
        return 'Too many requests. Please try again later.';
      default:
        return 'An error occurred while updating profile. Please try again.';
    }
  }

  /// General method to get appropriate error message based on operation type
  static String getErrorMessage(
      String errorCode, FirebaseAuthOperation operation) {
    switch (operation) {
      case FirebaseAuthOperation.signIn:
        return getSignInErrorMessage(errorCode);
      case FirebaseAuthOperation.register:
        return getRegistrationErrorMessage(errorCode);
      case FirebaseAuthOperation.passwordReset:
        return getPasswordResetErrorMessage(errorCode);
      case FirebaseAuthOperation.emailVerification:
        return getEmailVerificationErrorMessage(errorCode);
      case FirebaseAuthOperation.profileUpdate:
        return getProfileUpdateErrorMessage(errorCode);
    }
  }
}

/// Enum to define different Firebase Auth operations
enum FirebaseAuthOperation {
  signIn,
  register,
  passwordReset,
  emailVerification,
  profileUpdate,
}

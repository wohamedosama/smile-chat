class FirestoreErrorUtils {
  FirestoreErrorUtils._();

  /// Returns user-friendly error messages for Firestore errors
  static String getFirestoreErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'permission-denied':
        return 'Permission denied. Please check your authentication status and try again.';
      case 'unauthenticated':
        return 'You are not authenticated. Please log in again.';
      case 'unavailable':
        return 'Service temporarily unavailable. Please try again later.';
      case 'deadline-exceeded':
        return 'Request timeout. Please check your connection and try again.';
      case 'resource-exhausted':
        return 'Too many requests. Please wait a moment and try again.';
      case 'cancelled':
        return 'Operation was cancelled. Please try again.';
      case 'data-loss':
        return 'Data corruption detected. Please contact support.';
      case 'already-exists':
        return 'This item already exists.';
      case 'not-found':
        return 'The requested data was not found.';
      case 'failed-precondition':
        return 'Operation failed due to invalid conditions.';
      case 'aborted':
        return 'Operation was aborted. Please try again.';
      case 'out-of-range':
        return 'Request is out of valid range.';
      case 'unimplemented':
        return 'This feature is not yet implemented.';
      case 'internal':
        return 'Internal server error. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'An error occurred while accessing data. Please try again.';
    }
  }

  /// Returns user-friendly error messages for Firebase Storage errors
  static String getStorageErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'permission-denied':
        return 'Permission denied. Please check your authentication status.';
      case 'unauthenticated':
        return 'You are not authenticated. Please log in again.';
      case 'unavailable':
        return 'Storage service temporarily unavailable. Please try again later.';
      case 'object-not-found':
        return 'The requested file was not found.';
      case 'bucket-not-found':
        return 'Storage bucket not found. Please contact support.';
      case 'project-not-found':
        return 'Project not found. Please contact support.';
      case 'quota-exceeded':
        return 'Storage quota exceeded. Please contact support.';
      case 'retry-limit-exceeded':
        return 'Too many retry attempts. Please try again later.';
      case 'invalid-checksum':
        return 'File corruption detected. Please try uploading again.';
      case 'cancelled':
        return 'Upload was cancelled. Please try again.';
      case 'unknown':
        return 'Unknown error occurred. Please try again.';
      default:
        return 'An error occurred while accessing storage. Please try again.';
    }
  }

  /// General method to get appropriate error message based on error string
  static String getErrorMessage(String errorString) {
    // Check for specific error codes in the error string
    if (errorString.contains('permission-denied')) {
      return getFirestoreErrorMessage('permission-denied');
    } else if (errorString.contains('unauthenticated')) {
      return getFirestoreErrorMessage('unauthenticated');
    } else if (errorString.contains('unavailable')) {
      return getFirestoreErrorMessage('unavailable');
    } else if (errorString.contains('network')) {
      return getFirestoreErrorMessage('network-request-failed');
    } else if (errorString.contains('timeout')) {
      return getFirestoreErrorMessage('deadline-exceeded');
    } else if (errorString.contains('quota')) {
      return getFirestoreErrorMessage('resource-exhausted');
    } else if (errorString.contains('cancelled')) {
      return getFirestoreErrorMessage('cancelled');
    } else if (errorString.contains('not-found')) {
      return getFirestoreErrorMessage('not-found');
    } else if (errorString.contains('already-exists')) {
      return getFirestoreErrorMessage('already-exists');
    } else if (errorString.contains('internal')) {
      return getFirestoreErrorMessage('internal');
    }

    // Default fallback
    return getFirestoreErrorMessage('unknown');
  }

  /// Check if error is related to authentication
  static bool isAuthenticationError(String errorString) {
    return errorString.contains('permission-denied') ||
        errorString.contains('unauthenticated') ||
        errorString.contains('user-not-found') ||
        errorString.contains('invalid-user-token') ||
        errorString.contains('user-token-expired');
  }

  /// Check if error is related to network connectivity
  static bool isNetworkError(String errorString) {
    return errorString.contains('network') ||
        errorString.contains('timeout') ||
        errorString.contains('unavailable') ||
        errorString.contains('deadline-exceeded');
  }

  /// Check if error is temporary and can be retried
  static bool isRetryableError(String errorString) {
    return errorString.contains('unavailable') ||
        errorString.contains('timeout') ||
        errorString.contains('deadline-exceeded') ||
        errorString.contains('network') ||
        errorString.contains('resource-exhausted') ||
        errorString.contains('aborted') ||
        errorString.contains('cancelled');
  }
}

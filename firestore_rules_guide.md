# Firebase Firestore Security Rules Guide

## Common Permission Denied Issues and Solutions

### 1. Basic Authentication Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read/write access to authenticated users only
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 2. User-Specific Data Access

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;

      // Allow access to user's messages subcollection
      match /messages/{messageId} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
    }
  }
}
```

### 3. Chat Application Specific Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;

      // Messages subcollection
      match /messages/{messageId} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
    }

    // Public user profiles (for finding contacts)
    match /users/{userId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

### 4. Testing Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // TEMPORARY: Allow all access for testing (REMOVE IN PRODUCTION)
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

## Common Permission Denied Scenarios

### 1. User Not Authenticated

- **Error**: `permission-denied`
- **Cause**: User is not logged in
- **Solution**: Ensure user is authenticated before accessing Firestore

### 2. Insufficient Permissions

- **Error**: `permission-denied`
- **Cause**: User doesn't have permission to access specific document
- **Solution**: Update security rules to allow proper access

### 3. Network Issues

- **Error**: `unavailable` or `deadline-exceeded`
- **Cause**: Poor network connection
- **Solution**: Implement retry logic and offline support

### 4. Quota Exceeded

- **Error**: `resource-exhausted`
- **Cause**: Too many requests
- **Solution**: Implement rate limiting and caching

## Best Practices

1. **Always authenticate users** before accessing Firestore
2. **Use specific rules** instead of broad permissions
3. **Test rules thoroughly** before deploying
4. **Implement proper error handling** in your app
5. **Use offline persistence** for better user experience
6. **Monitor usage** to avoid quota issues

## Debugging Tips

1. Check Firebase Console for rule violations
2. Use Firebase Emulator for local testing
3. Enable debug logging in your app
4. Monitor Firebase Analytics for errors
5. Test with different user roles and permissions

import 'package:firebase_auth/firebase_auth.dart';

const String loginUsingMobileNumber = '/loginUsingMobileNumber';
const String loginUsingEmail = '/loginUsingEmail';
const String getOTPScreen = '/getOTPScreen';
const String registerScreen = '/registerScreen';
const String homeScreen = '/homeScreen';
const String searchScreen = '/searchScreen';
const String profileScreen = '/profileScreen';
const String storyViewedScreen = '/storyViewScreen';
const String messageScreen = '/messageScreen';
const String forgetPasswordScreen = '/forgetPasswordScreen';
const String landingScreen = '/';
const String storiesCollection = 'stories';
const String chatCollections = 'chats';
const String usersCollections = 'users';
const String contactsCollection = 'contacts';
const String messagesCollection = 'message';
final userId = FirebaseAuth.instance.currentUser?.uid;

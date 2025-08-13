import 'package:get_it/get_it.dart';
import 'package:smile_chat/features/auth/cubit/email_auth/email_auth_cubit.dart';
import 'package:smile_chat/features/chats/cubit/chat_cubit/chat_cubit.dart';
import 'package:smile_chat/features/chats/cubit/message_cubit/message_cubit.dart';
import 'package:smile_chat/features/home/cubit/search_cubit/search_cubit.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<EmailAuthCubit>(() => EmailAuthCubit());
  getIt.registerLazySingleton<ChatCubit>(() => ChatCubit());
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit());
  getIt.registerLazySingleton<MessageCubit>(() => MessageCubit());
}

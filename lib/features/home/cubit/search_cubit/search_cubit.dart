import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void setAllChats(List<ChatModel> chats) {
    emit(state.copyWith(
      allChats: chats,
      isLoading: false,
    ));
  }

  void filterChats(String searchedChat) {
    final bool hasSearched = searchedChat.isNotEmpty;
    if (searchedChat.isEmpty) {
      emit(state.copyWith(
        hasSearched: false,
        filteredChats: [],
      ));
    } else {
      final filteredChats = state.allChats
          .where((chat) =>
              chat.name.toLowerCase().contains(searchedChat.toLowerCase()))
          .toList();
      emit(state.copyWith(
          filteredChats: filteredChats, hasSearched: hasSearched));
    }
  }

  void clearSearch() {
    emit(state.copyWith(
      filteredChats: [],
      hasSearched: false,
    ));
  }
}

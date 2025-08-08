part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<ChatModel> allChats;
  final List<ChatModel> filteredChats;
  final bool? isLoading;
  final bool? hasSearched;
  final String? errorMessage;

  const SearchState({
    this.allChats = const [],
    this.filteredChats = const [],
    this.isLoading = false,
    this.hasSearched = false,
    this.errorMessage,
  });

  SearchState copyWith({
    List<ChatModel>? filteredChats,
    List<ChatModel>? allChats,
    bool? isLoading,
    bool? hasSearched,
    String? errorMessage,
  }) {
    return SearchState(
      allChats: allChats ?? this.allChats,
      errorMessage: errorMessage ?? this.errorMessage,
      hasSearched: hasSearched ?? this.hasSearched,
      filteredChats: filteredChats ?? this.filteredChats,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        filteredChats,
        isLoading,
        hasSearched,
        errorMessage,
        allChats,
      ];
}

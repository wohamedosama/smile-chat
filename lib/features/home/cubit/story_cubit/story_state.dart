part of 'story_cubit.dart';

class StoryState extends Equatable {
  final bool? storyLoading;
  final bool? storyLoaded;
  final String? errorMessage;
  final List<StoryModel>? stories;
  final List<StoryModel>? userStoreis;
  final bool? isViewed;
  final bool? isUploading;
  final StoryModel? currentViewingStory;
  const StoryState({
    this.currentViewingStory,
    this.isUploading = false,
    this.userStoreis,
    this.errorMessage,
    this.isViewed = false,
    this.stories,
    this.storyLoading = false,
    this.storyLoaded = false,
  });

  @override
  List<Object?> get props => [
        storyLoading,
        storyLoaded,
        errorMessage,
        stories,
        isViewed,
        userStoreis,
        isUploading,
        currentViewingStory,
      ];

  StoryState copyWith({
    bool? isViewed,
    bool? storyLoading,
    bool? storyLoaded,
    String? errorMessage,
    List<StoryModel>? stories,
    List<StoryModel>? userStoreis,
    bool? isUploading,
    StoryModel? currentViewingStory,
  }) {
    return StoryState(
      currentViewingStory: currentViewingStory ?? this.currentViewingStory,
      isUploading: isUploading ?? this.isUploading,
      userStoreis: userStoreis ?? this.userStoreis,
      isViewed: isViewed ?? this.isViewed,
      stories: stories ?? this.stories,
      errorMessage: errorMessage ?? this.errorMessage,
      storyLoading: storyLoading ?? this.storyLoading,
      storyLoaded: storyLoaded ?? this.storyLoaded,
    );
  }
}

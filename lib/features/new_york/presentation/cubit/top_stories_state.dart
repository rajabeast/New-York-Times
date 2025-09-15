part of 'cubit.dart';

class TopStoriesState extends Equatable {
  final AppStateStatus status;
  final List<TopStoriesModel> stories;
  final List<TopStoriesModel> filteredStories;
  final String message;
  final String selectedSection;
  final String searchQuery;
  final bool isListView;

  const TopStoriesState({
    this.status = AppStateStatus.initial,
    this.stories = const [],
    this.filteredStories = const [],
    this.message = '',
    this.selectedSection = 'home',
    this.searchQuery = '',
    this.isListView = true,
  });

  TopStoriesState copyWith({
    AppStateStatus? status,
    List<TopStoriesModel>? stories,
    List<TopStoriesModel>? filteredStories,
    String? message,
    String? selectedSection,
    String? searchQuery,
    bool? isListView,
  }) {
    return TopStoriesState(
      status: status ?? this.status,
      stories: stories ?? this.stories,
      filteredStories: filteredStories ?? this.filteredStories,
      message: message ?? this.message,
      selectedSection: selectedSection ?? this.selectedSection,
      searchQuery: searchQuery ?? this.searchQuery,
      isListView: isListView ?? this.isListView,
    );
  }

  @override
  List<Object?> get props => [
    status,
    stories,
    filteredStories,
    message,
    selectedSection,
    searchQuery,
    isListView,
  ];
}

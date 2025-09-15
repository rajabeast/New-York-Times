part of 'cubit.dart';

class TopStoriesCubit extends Cubit<TopStoriesState> {
  final TopStoriesRepo repository;

  TopStoriesCubit(this.repository) : super(const TopStoriesState());

  /// Fetch top stories
  Future<void> getTopStories({String? section}) async {
    try {
      emit(state.copyWith(status: AppStateStatus.loading));

      final sectionToFetch = section ?? state.selectedSection;
      final response = await repository.getTopStories(section: sectionToFetch);

      response.fold(
        (error) => emit(
          state.copyWith(
            status: AppStateStatus.failure,
            message: 'Failed to fetch top stories: ${error.toString()}',
          ),
        ),
        (stories) {
          final filteredStories = _filterStories(stories, state.searchQuery);
          emit(
            state.copyWith(
              status: AppStateStatus.success,
              stories: stories,
              filteredStories: filteredStories,
              selectedSection: sectionToFetch,
              message: 'Top stories fetched successfully',
            ),
          );
        },
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: AppStateStatus.failure,
          message: 'Unexpected error: $e',
        ),
      );
    }
  }

  /// Search stories by title or author
  void searchStories(String query) {
    final filteredStories = _filterStories(state.stories, query);
    emit(state.copyWith(searchQuery: query, filteredStories: filteredStories));
  }

  /// Filter by section
  Future<void> filterBySection(String section) async {
    if (section != state.selectedSection) {
      await getTopStories(section: section);
    }
  }

  /// Toggle between list and card view
  void toggleView() {
    emit(state.copyWith(isListView: !state.isListView));
  }

  /// Refresh stories
  Future<void> refreshStories() async {
    await getTopStories();
  }

  /// Helper method to filter stories - properly typed
  List<TopStoriesModel> _filterStories(
    List<TopStoriesModel> stories,
    String query,
  ) {
    if (query.isEmpty) return stories;

    return stories.where((story) {
      final title = story.title?.toLowerCase() ?? '';
      final byline = story.byline?.toLowerCase() ?? '';
      final searchQuery = query.toLowerCase();

      return title.contains(searchQuery) || byline.contains(searchQuery);
    }).toList();
  }
}

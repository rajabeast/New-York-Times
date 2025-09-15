part of 'repo.dart';

class TopStoriesRepoImpl with ExceptionMixin implements TopStoriesRepo {
  /// [TopStoriesDatasource] is the data source for [TopStoriesRepoImpl]
  final TopStoriesDatasource topStoriesDatasource;

  /// [TopStoriesRepoImpl] constructor
  TopStoriesRepoImpl(this.topStoriesDatasource);

  @override
  Future<Either<CustomException, List<TopStoriesModel>>> getTopStories({
    String? section,
  }) async => await handleFuture(() async {
    final response = await topStoriesDatasource.getTopStories(
      section: section ?? 'home',
    );
    return response;
  });
}

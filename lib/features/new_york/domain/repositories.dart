part of 'domain.dart';

abstract class TopStoriesRepo {
  /// Get all top stories
  Future<Either<CustomException, List<TopStoriesModel>>> getTopStories({
    String? section,
  });
}

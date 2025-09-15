part of 'datasource.dart';

class TopStoriesDatasource {
  final NetworkClient networkClient;
  final String tag = 'TopStoriesDatasource';
  final LoggerUtils logger = sl<LoggerUtils>();

  TopStoriesDatasource(this.networkClient);

  /// Get all top stories
  Future<List<TopStoriesModel>> getTopStories({String section = 'home'}) async {
    try {
      final Response<dynamic> response = await networkClient.invoke(
        ApiEndPoint.getTopStories.replaceAll('{section}', section),
        RequestType.get,
      );

      final parser = ApiListParser(
        tag: tag,
        fromJson: TopStoriesModel.fromJson,
        logger: logger,
      );
      return parser.parseListResponse(response);
    } catch (e) {
      logger.logError(tag, 'Failed to Fetch Top Stories: $e');
      rethrow;
    }
  }
}

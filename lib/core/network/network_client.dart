part of 'network.dart';

enum RequestType { get, post, put, delete, patch }

class NetworkClient {
  late Dio _dio;

  NetworkClient() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://api.nytimes.com/svc/topstories/v2/';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['api-key'] = dotenv.env['NYT_API_KEY'];
          handler.next(options);
        },
      ),
    );
  }

  Future<Response> invoke(
    String endpoint,
    RequestType requestType, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      Response response;
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(endpoint, queryParameters: queryParameters);
          break;
        case RequestType.post:
          response = await _dio.post(
            endpoint,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.put:
          response = await _dio.put(
            endpoint,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.delete:
          response = await _dio.delete(
            endpoint,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.patch:
          response = await _dio.patch(
            endpoint,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

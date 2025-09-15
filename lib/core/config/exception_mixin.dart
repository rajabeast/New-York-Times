part of 'config.dart';

mixin ExceptionMixin {
  Future<Either<CustomException, T>> handleFuture<T>(
    Future<T> Function() future,
  ) async {
    try {
      final result = await future();
      return Right(result);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? 'Network error'));
    } catch (e) {
      return Left(CustomException(e.toString()));
    }
  }
}

part of 'di.dart';

final sl = GetIt.instance;

Future<void> initDl() async {
  // Core
  sl.registerLazySingleton<NetworkClient>(() => NetworkClient());
  sl.registerLazySingleton<LoggerUtils>(() => LoggerUtils());

  // Data Sources
  sl.registerLazySingleton<TopStoriesDatasource>(
    () => TopStoriesDatasource(sl()),
  );

  // Repositories
  sl.registerLazySingleton<TopStoriesRepo>(() => TopStoriesRepoImpl(sl()));

  // Cubits
  sl.registerFactory<TopStoriesCubit>(() => TopStoriesCubit(sl()));
}

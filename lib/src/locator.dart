import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/src/data/datasourses/local/app_database.dart';
import 'package:news/src/data/datasourses/remote/news_api_service.dart';
import 'package:news/src/data/reprositories/api_repository_impl.dart';
import 'package:news/src/data/reprositories/database_repository_impl.dart';
import 'package:news/src/domain/reprositories/api_repository.dart';
import 'package:news/src/domain/reprositories/database_repository.dart';
import 'package:news/src/utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);
  locator.registerSingleton<DatabaseRepository>(DatabaseRepositoryImpl(locator<AppDatabase>()));

  final dio = Dio();
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<NewsApiService>(NewsApiService(locator<Dio>()));
  locator.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(locator<NewsApiService>()));
}

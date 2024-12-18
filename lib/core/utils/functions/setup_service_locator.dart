import 'package:bookly_app/core/service/api_services.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/search/data/datasources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/data/repositories/search_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServersLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
        homeRemoteDataSource: HomeRemoteDataSourceImp(getIt.get<ApiServices>()),
        homeLocalDataSource: HomeLocalDataSourceImp()),
  );
  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(
        searchRemoteDataSource:
            SearchRemoteDataSourceImp(getIt.get<ApiServices>()),
        searchLocalDataSource: SearchLocalDataSourceImp()),
  );
}

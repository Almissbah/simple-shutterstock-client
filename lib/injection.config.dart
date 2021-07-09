// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di/api_module.dart';
import 'core/network/services/images_api_service.dart';
import 'features/images/presentation/bloc/images_bloc.dart';
import 'features/images/data/datasources/images_remote_data_source.dart';
import 'features/images/domain/repos/images_repository.dart';
import 'features/images/data/repos/images_repository_impl.dart';
import 'features/images/domain/usecases/load_images_page.dart';
import 'core/network/network_info.dart';
import 'di/platform_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final platformModule = _$PlatformModule();
  final apiModule = _$ApiModule();
  gh.factory<DataConnectionChecker>(
      () => platformModule.getDataConnectionChecker());
  gh.factory<Dio>(() => apiModule.getDio());
  gh.factory<ImagesApiService>(
      () => apiModule.getShortlyApiService(get<Dio>()));
  gh.factory<LoadImagesPage>(
      () => LoadImagesPage(imagesRepository: get<ImagesRepository>()));
  gh.factory<ImagesBloc>(() => ImagesBloc(get<LoadImagesPage>()));

  // Eager singletons must be registered in the right order
  gh.singleton<ImagesRemoteDataSource>(
      ImagesRemoteDataSourceImpl(imagesApiService: get<ImagesApiService>()));
  gh.singleton<NetworkInfo>(
      NetworkInfoImpl(dataConnectionChecker: get<DataConnectionChecker>()));
  gh.singleton<ImagesRepository>(ImagesRepositoryImpl(
      imagesRemoteDataSource: get<ImagesRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  return get;
}

class _$PlatformModule extends PlatformModule {}

class _$ApiModule extends ApiModule {}

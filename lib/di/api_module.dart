import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shutterstock_client/core/network/services/images_api_service.dart';
import 'package:shutterstock_client/core/utils/token.dart'; 

@module
abstract class ApiModule {
  @preResolve
  Dio getDio() {
    var dio = Dio();
    
    dio.options.headers['Authorization'] = jwtToken;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }

  @preResolve
  ImagesApiService getShortlyApiService(Dio dio) {
    return ImagesApiService(dio);
  }
}

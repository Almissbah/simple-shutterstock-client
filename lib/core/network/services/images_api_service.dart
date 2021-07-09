import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shutterstock_client/features/images/data/models/images_api_response.dart';
part 'images_api_service.g.dart';

@RestApi(baseUrl: "https://api.shutterstock.com/v2")
abstract class ImagesApiService {
  factory ImagesApiService(Dio dio) = _ImagesApiService;

  @GET("/images/search")
  Future<HttpResponse<ImagesApiResponse>> fetchImagesPage(
      {@required @Query("query") String query,
      @required @Query("page") int pageNumber,
      @required @Query("per_page") int imagesPerPage});
}

 

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shutterstock_client/core/error/exceptions.dart';
import 'package:shutterstock_client/core/network/services/images_api_service.dart';
import 'package:shutterstock_client/features/images/data/models/images_page_model.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';

abstract class ImagesRemoteDataSource {
  Future<ImagesPage> loadImages(
      {String query, int pageNumber, int imagesPerPage});
}


@Singleton(as: ImagesRemoteDataSource)
class ImagesRemoteDataSourceImpl extends ImagesRemoteDataSource {
  final ImagesApiService imagesApiService;

  ImagesRemoteDataSourceImpl({@required this.imagesApiService});
  @override
  Future<ImagesPage> loadImages(
      {String query, int pageNumber, int imagesPerPage}) async {
    var response = await imagesApiService.fetchImagesPage(
        query: query, pageNumber: pageNumber, imagesPerPage: imagesPerPage);

    if (response.response.statusCode == 200)
      return ImagesPageModel.fromApiResonse(response.data);
    else {
      throw ServerExeption();
    }
  }
}

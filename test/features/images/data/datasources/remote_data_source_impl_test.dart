 
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shutterstock_client/core/error/exceptions.dart';
import 'package:shutterstock_client/core/network/services/images_api_service.dart';
import 'package:shutterstock_client/features/images/data/datasources/images_remote_data_source.dart';
import 'package:shutterstock_client/features/images/data/models/images_api_response.dart';
import 'package:shutterstock_client/features/images/data/models/images_page_model.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'package:mockito/mockito.dart';

class MockImagesApiService extends Mock implements ImagesApiService {}

void main() {
  MockImagesApiService mockImagesApiService;
  ImagesRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockImagesApiService = MockImagesApiService();
    dataSourceImpl =
        ImagesRemoteDataSourceImpl(imagesApiService: mockImagesApiService);
  });

  group('loginUser', () {
    final Params tParams =
        Params(pageNumber: 1, query: "images", imagesPerPage: 5);
    final ImagesApiResponse tImagesApiResponse = ImagesApiResponse(
        pageNumber: 1,
        imagesData: [],
        imagesPerPage: 5,
        searchId: "random",
        totalCount: 100);

    final ImagesPageModel tImagesPageModel = ImagesPageModel(
        pageNumber: 1,
        imagesData: [],
        imagesPerPage: 5,
        searchId: "random",
        totalCount: 100);
    test('should return the ImagesPageModel object if the status code is 200',
        () async {
      //arrange
      when(mockImagesApiService.fetchImagesPage(
              imagesPerPage: tParams.imagesPerPage,
              pageNumber: tParams.pageNumber,
              query: tParams.query))
          .thenAnswer((_) async => HttpResponse(
              tImagesApiResponse,
              Response(
                  data: fixture('images_response.json'), statusCode: 200)));
      //act
      final result = await dataSourceImpl.loadImages(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query);

      //assert
      verify(mockImagesApiService.fetchImagesPage(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query));
      expect(result, equals(tImagesPageModel));
    });

    test('should throw an exception if the status code is not 200', () async {
      //arrange
      when(mockImagesApiService.fetchImagesPage(
              imagesPerPage: tParams.imagesPerPage,
              pageNumber: tParams.pageNumber,
              query: tParams.query))
          .thenAnswer((_) async => HttpResponse(
              tImagesApiResponse,
              Response(
                  data: fixture('images_response.json'), statusCode: 500)));

      //act
      final call = dataSourceImpl.loadImages;

      //assert
      expect(
          () => call(
              imagesPerPage: tParams.imagesPerPage,
              pageNumber: tParams.pageNumber,
              query: tParams.query),
          throwsA(isA<ServerExeption>()));
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/core/error/exceptions.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:shutterstock_client/core/network/network_info.dart';
import 'package:shutterstock_client/features/images/data/datasources/images_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:shutterstock_client/features/images/data/repos/images_repository_impl.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';

class MockImagesRemoteDataSource extends Mock
    implements ImagesRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ImagesRepositoryImpl repository;
  MockImagesRemoteDataSource mockImagesRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockImagesRemoteDataSource = MockImagesRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ImagesRepositoryImpl(
        networkInfo: mockNetworkInfo,
        imagesRemoteDataSource: mockImagesRemoteDataSource);
  });

  final Params tParams =
      Params(pageNumber: 1, query: "images", imagesPerPage: 5);
  final ImagesPage tImagesPage = ImagesPage(
      pageNumber: 1,
      imagesData: [],
      imagesPerPage: 5,
      searchId: "random",
      totalCount: 100);

  group("device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should return the ImagesPage when the remote call is successfull',
        () async {
      //arrange
      when(mockImagesRemoteDataSource.loadImages(
              imagesPerPage: tParams.imagesPerPage,
              pageNumber: tParams.pageNumber,
              query: tParams.query))
          .thenAnswer((_) async => tImagesPage);

      //act
      final result = await repository.loadImages(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query);

      //assert
      verify(mockImagesRemoteDataSource.loadImages(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query));
      expect(result, equals(Right(tImagesPage)));
    });

    test('should return a failure when the remote call is unsuccessfull',
        () async {
      //arrange
      when(mockImagesRemoteDataSource.loadImages(
              imagesPerPage: tParams.imagesPerPage,
              pageNumber: tParams.pageNumber,
              query: tParams.query))
          .thenThrow(ServerExeption());

      //act
      final result = await repository.loadImages(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query);

      //assert
      verify(mockImagesRemoteDataSource.loadImages(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query)); 
      expect(result, equals(Left<Failure, ImagesPage>(ServerFailure())));
    });
  });

  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('should return a NoConnectionFailure if the device is offline',
        () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(false));

      //act
      final result = await repository.loadImages(
          imagesPerPage: tParams.imagesPerPage,
          pageNumber: tParams.pageNumber,
          query: tParams.query);

      //assert
      verifyZeroInteractions(mockImagesRemoteDataSource);
      expect(result, equals(Left<Failure, ImagesPage>(NoConnectionFailure())));
    });
  });
}

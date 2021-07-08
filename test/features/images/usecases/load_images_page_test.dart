import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/features/images/domain/repos/images_repository.dart';

import 'package:mockito/mockito.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockImagesRepository extends Mock implements ImagesRepository {}

void main() {
  MockImagesRepository mockUserRepository;
  LoadImagesPage useCase;

  setUp(() {
    mockUserRepository = MockImagesRepository();
    useCase = LoadImagesPage(imagesRepository: mockUserRepository);
  });

  final Params tParams =
      Params(pageNumber: 1, query: "images", imagesPerPage: 5);
  final ImagesPage tImagesPage = ImagesPage(
      pageNumber: 1,
      imagesData: [],
      imagesPerPage: 5,
      searchId: "random",
      totalCount: 100);
  test('should return a ImagesPage object when requested with a valid params',
      () async {
    //arrange
    when(mockUserRepository.loadImages(
            imagesPerPage: tParams.imagesPerPage,
            pageNumber: tParams.pageNumber,
            query: tParams.query))
        .thenAnswer((_) async => Right(tImagesPage));

    //act
    final result = await useCase(tParams);

    //assert
    expect(result, Right(tImagesPage));
    verify(mockUserRepository.loadImages(
        imagesPerPage: tParams.imagesPerPage,
        pageNumber: tParams.pageNumber,
        query: tParams.query));
    verifyNoMoreInteractions(mockUserRepository);
  });
}

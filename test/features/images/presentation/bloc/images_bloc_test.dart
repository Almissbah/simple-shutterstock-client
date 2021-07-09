import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';
import 'package:shutterstock_client/features/images/presentation/bloc/images_bloc.dart';

import '../../../../fixtures/utils.dart';

class MockLoadImagesPage extends Mock implements LoadImagesPage {}

void main() {
  ImagesBloc imagesBloc;
  MockLoadImagesPage mockLoadImagesPage;

  setUp(() {
    mockLoadImagesPage = MockLoadImagesPage();
    imagesBloc = ImagesBloc(mockLoadImagesPage);
  });

  tearDown(() {
    imagesBloc.close();
  });

  final String tQuery = 'test';
  final int tPageNumber = 1;

  test('should initial state equals to ImagesInitial', () async {
    //assert
    expect(imagesBloc.initialState, equals(ImagesInitial()));
  });

  group(
    'load images',
    () {
      test('should return an error if load images is not successfull',
          () async {
        //arrange
        when(mockLoadImagesPage(any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        imagesBloc.loadImages(query: tQuery, pageNumber: tPageNumber);

        //assert
        expectLater(
          imagesBloc,
          emitsInOrder(
            [ImagesInitial(), ImagesLoading(), ImagesFailure("")],
          ),
        );
      });

      test(
        'should return ImagesPage if request is successfull',
        () async {
          //arrange
          when(mockLoadImagesPage(any))
              .thenAnswer((_) async => Right(TestUtils.getImagesPage()));

          //act
          imagesBloc.loadImages(query: tQuery, pageNumber: tPageNumber);

          //assert
          expectLater(
            imagesBloc,
            emitsInOrder(
              [
                ImagesInitial(),
                ImagesLoading(),
                ImagesSuccess(TestUtils.getImagesPage())
              ],
            ),
          );
        },
      );
    },
  );
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';
import 'package:shutterstock_client/features/images/presentation/bloc/images_bloc.dart';

import 'package:mockito/mockito.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/simple_images_list_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/simple_images_list_widget.dart';

import '../../../../../fixtures/testable_widget_builder.dart';
import '../../../../../fixtures/utils.dart';

class MockLoadImagesPage extends Mock implements LoadImagesPage {}

void main() {
  ImagesBloc imagesBloc;
  MockLoadImagesPage mockLoadImagesPage;

  group("simple images list widget", () {
    setUp(() {
      mockLoadImagesPage = MockLoadImagesPage();
      imagesBloc = ImagesBloc(mockLoadImagesPage);
    });

    tearDown(() {
      imagesBloc.close();
    });

    testWidgets('should have bloc listner and paged list view.',
        (WidgetTester tester) async {
      //arrange
      when(mockLoadImagesPage(any))
          .thenAnswer((_) async => Right(TestUtils.getImagesPage()));
      //act
      await tester.pumpWidget(
          getTestableWidget(widget: SimpleImageListWidget(), bloc: imagesBloc));

      //assert
      expect(find.byKey(Key(SimpleImagesListKeys.BLOC_LISTENER_KEY)),
          findsOneWidget);
      expect(find.byKey(Key(SimpleImagesListKeys.PAGED_LIST_VIEW_KEY)),
          findsOneWidget);
    });
 
  });
}

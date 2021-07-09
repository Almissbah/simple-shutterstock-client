import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';
import 'package:shutterstock_client/features/images/presentation/bloc/images_bloc.dart';
import 'package:shutterstock_client/features/images/presentation/ui/images_screen.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/images_screen_keys.dart';

import '../../../../fixtures/testable_widget_builder.dart';
import 'package:mockito/mockito.dart';

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

  testWidgets('ImagesScreen has its widgets', (WidgetTester tester) async {
    //arrange
    when(mockLoadImagesPage(any))
        .thenAnswer((_) async => Right(TestUtils.getImagesPage()));
   //act
    await tester.pumpWidget(
        getTestableWidget(widget: ImagesScreen(), bloc: imagesBloc));

   //assert
    expect(find.byKey(Key(ImagesScreenKeys.SCAFOLD_KEY)), findsOneWidget);
    expect(find.byKey(Key(ImagesScreenKeys.TITLE_TEXT_KEY)), findsOneWidget);
    expect(find.byKey(Key(ImagesScreenKeys.BODY_KEY)), findsOneWidget);
    expect(find.byKey(Key(ImagesScreenKeys.IMAGE_LIST_WIDGET_KEY)),
        findsOneWidget);
  });
}

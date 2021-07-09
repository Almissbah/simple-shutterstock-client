import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';
import 'package:shutterstock_client/features/splash/presentation/ui/keys/splash_screen_keys.dart';
import 'package:shutterstock_client/features/splash/presentation/ui/splash_screen.dart';

import '../../../../fixtures/testable_widget_builder.dart';
import 'package:mockito/mockito.dart';

class MockLoadImagesPage extends Mock implements LoadImagesPage {}

void main() {
  testWidgets('Splash screen has its logo', (WidgetTester tester) async {
    await tester.runAsync(() async {
       //act
      await tester
          .pumpWidget(getTestableWidget(widget: SplashScreen(), bloc: null));

      //assert
      expect(find.byKey(Key(SplashScreenKeys.SCAFOLD_KEY)), findsOneWidget);
      expect(find.byKey(Key(SplashScreenKeys.LOGO_KEY)), findsOneWidget);
    });
  });
}

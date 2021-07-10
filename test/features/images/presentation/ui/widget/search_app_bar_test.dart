import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/features/images/presentation/bloc/images_bloc.dart';

import 'package:mockito/mockito.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/search_app_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/simple_images_list_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/search_app_bar.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/simple_images_list_widget.dart';

import '../../../../../fixtures/testable_widget_builder.dart';

void main() {
  group("search app bar", () {
    testWidgets('should show search button in initail state.',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(getTestableWidget(
          widget: SearchAppBar(
        title: Text("Title"),
        onSearchQueryChanged: (_) {},
      )));

      //assert
      expect(find.byKey(Key(SearchAppBarKeys.APP_BAR_KEY)), findsOneWidget);
      expect(
          find.byKey(Key(SearchAppBarKeys.SEARCH_BUTTON_KEY)), findsOneWidget);
    });

    testWidgets('should show search button in initail state.',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(getTestableWidget(
          widget: SearchAppBar(
        title: Text("Title"),
        onSearchQueryChanged: (_) {},
      )));

      //assert
      expect(find.byKey(Key(SearchAppBarKeys.APP_BAR_KEY)), findsOneWidget);
      expect(
          find.byKey(Key(SearchAppBarKeys.SEARCH_BUTTON_KEY)), findsOneWidget);
      expect(find.byKey(Key(SearchAppBarKeys.CLEAR_BUTTON_KEY)), findsNothing);
      expect(find.byKey(Key(SearchAppBarKeys.SEARCH_FIELD_KEY)), findsNothing);
      expect(find.byKey(Key(SearchAppBarKeys.BACK_BUTTON_KEY)), findsNothing);
    });

    testWidgets('should show search field when search button is tapped.',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(getTestableWidget(
          widget: SearchAppBar(
        title: Text("Title"),
        onSearchQueryChanged: (_) {},
      )));

      await tester.tap(find.byKey(Key(SearchAppBarKeys.SEARCH_BUTTON_KEY)));
      await tester.pump();
      //assert
      expect(find.byKey(Key(SearchAppBarKeys.SEARCH_BUTTON_KEY)), findsNothing);
      expect(
          find.byKey(Key(SearchAppBarKeys.CLEAR_BUTTON_KEY)), findsOneWidget);
      expect(
          find.byKey(Key(SearchAppBarKeys.SEARCH_FIELD_KEY)), findsOneWidget);
      expect(find.byKey(Key(SearchAppBarKeys.BACK_BUTTON_KEY)), findsOneWidget);
    });

    testWidgets('should remove search field when back button is tapped.',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(getTestableWidget(
          widget: SearchAppBar(
        title: Text("Title"),
        onSearchQueryChanged: (_) {},
      )));

      await tester.tap(find.byKey(Key(SearchAppBarKeys.SEARCH_BUTTON_KEY)));
      await tester.pump();

      expect(
          find.byKey(Key(SearchAppBarKeys.SEARCH_FIELD_KEY)), findsOneWidget);
      expect(find.byKey(Key(SearchAppBarKeys.BACK_BUTTON_KEY)), findsOneWidget);

      await tester.tap(find.byKey(Key(SearchAppBarKeys.BACK_BUTTON_KEY)));
      await tester.pump();

      expect(find.byKey(Key(SearchAppBarKeys.SEARCH_FIELD_KEY)), findsNothing);
      expect(find.byKey(Key(SearchAppBarKeys.BACK_BUTTON_KEY)), findsNothing);
    });
  });
}

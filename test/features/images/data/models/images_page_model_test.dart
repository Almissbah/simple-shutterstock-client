import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/features/images/data/models/images_api_response.dart';
import 'package:shutterstock_client/features/images/data/models/images_page_model.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';

import '../../../../fixtures/utils.dart';

main() {
  ImagesApiResponse tImagesApiResponse;
  ImagesPage tImagesPage;
  setUp(() {
    tImagesApiResponse = TestUtils.getImagesApiResponse();
    tImagesPage = TestUtils.getImagesPage();
  });

  test("should build ImagesPage object from ImagesApiResponse", () {
    var result = ImagesPageModel.fromApiResonse(tImagesApiResponse);
    expect(result, isA<ImagesPage>());
    expect(result.props, equals(tImagesPage.props));
  });
}

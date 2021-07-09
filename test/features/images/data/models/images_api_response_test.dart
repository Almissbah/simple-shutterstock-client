import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_client/features/images/data/models/images_api_response.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../fixtures/utils.dart';

main() {
  ImagesApiResponse tImagesApiResponse;
  setUp(() {
    tImagesApiResponse = TestUtils.getImagesApiResponse();
  });

  test("should parse ImagesApiResponse from json data", () {
    var result =
        ImagesApiResponse.fromJson(jsonDecode(fixture('images_response.json')));

    expect(result, equals(tImagesApiResponse));
  });
}

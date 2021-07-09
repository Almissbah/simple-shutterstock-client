// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/images_screen_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/simple_images_list_keys.dart';
import 'package:shutterstock_client/features/splash/presentation/ui/keys/splash_screen_keys.dart';
import 'package:test/test.dart';

import 'utils/my_driver.dart';

void main() {
  try {
    group('wathiq tests', () {
      FlutterDriver driver;
      MyTestDriver myDriver;

      // Connect to the Flutter driver before running any tests.
      setUpAll(() async {
        driver = await FlutterDriver.connect();
        myDriver = MyTestDriver(driver);
      });

      // Close the connection to the driver after the tests have completed.
      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });

      test('test app is launching', () async {
        await myDriver.delay(1);
        await myDriver.waitFor(SplashScreenKeys.SCAFOLD_KEY);
        await myDriver.expectPresent(SplashScreenKeys.LOGO_KEY);
      });

      test('test images screen is launching', () async {
        await myDriver.delay(1);
        await myDriver.waitFor(ImagesScreenKeys.SCAFOLD_KEY);
        await myDriver.expectPresent(ImagesScreenKeys.TITLE_TEXT_KEY);
      });

      test('test pagination scrolling', () async {
        await myDriver.scrollToPosition(
            SimpleImagesListKeys.IMAGE_LIST_WIDGET_KEY,
            SimpleImagesListKeys.LIST_ITEM_IMAGE_KEY_PRIFIX + '_4');
        await myDriver.delay(1);
        await myDriver.expectPresent(
            SimpleImagesListKeys.LIST_ITEM_IMAGE_KEY_PRIFIX + '_4');
                   await myDriver.expectPresent(
            SimpleImagesListKeys.LIST_ITEM_DESC_KEY_PRIFIX + '_4');
      });
    });
  } catch (e, s) {
    print(s);
  }
}

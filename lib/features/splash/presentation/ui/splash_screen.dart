import 'package:flutter/material.dart';
import 'package:shutterstock_client/core/utils/configs.dart';
import 'package:shutterstock_client/features/images/presentation/ui/images_screen.dart';
import 'package:shutterstock_client/features/splash/presentation/ui/keys/splash_screen_keys.dart';
import 'package:shutterstock_client/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: SPLASH_SCREEN_DELAY_IN_MS), () {
      Navigator.pushReplacementNamed(context, ImagesScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(SplashScreenKeys.SCAFOLD_KEY),
      body: Center(
        child: Container(
          child: Assets.images.logo.image(width: 100,height: 100,key: Key(SplashScreenKeys.LOGO_KEY)),
        ),
      ),
    );
  }
}

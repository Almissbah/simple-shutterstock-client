import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

import 'features/images/presentation/bloc/images_bloc.dart';
import 'features/images/presentation/ui/images_screen.dart';
import 'features/splash/presentation/ui/splash_screen.dart';
import 'injection.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShutterAPI Client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        ImagesScreen.routeName: (context) => BlocProvider<ImagesBloc>.value(
              value: getIt<ImagesBloc>(),
              child: ImagesScreen(),
            ),
      },
    );
  }
}

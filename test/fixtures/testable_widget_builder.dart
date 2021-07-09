import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shutterstock_client/features/images/presentation/bloc/images_bloc.dart';

Widget getTestableWidget({@required Widget widget, Bloc bloc}) {
  return MaterialApp(
      home:  bloc!=null? BlocProvider<ImagesBloc>(
              create: (context) => bloc,
              child: Directionality(
                  textDirection: TextDirection.rtl, child: Material(child: widget)),
            ):widget,
  );
}
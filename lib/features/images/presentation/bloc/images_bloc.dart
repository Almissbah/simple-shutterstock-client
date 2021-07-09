import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/features/images/domain/usecases/load_images_page.dart';

part 'images_event.dart';
part 'images_state.dart';

@injectable
class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  LoadImagesPage _loadImagesPage;
  ImagesBloc(this._loadImagesPage);

  @override
  Stream<ImagesState> mapEventToState(
    ImagesEvent event,
  ) async* {
    if (event is LoadImagesEvent) {
      yield ImagesLoading();
      Either<Failure, ImagesPage> result = await _loadImagesPage(Params(
          pageNumber: event.pageNumber,
          query: event.query,
          imagesPerPage: event.itemsPerPage));

          
      yield* result.fold((failure) async* {
        yield ImagesFailure(failure.msg);
      }, (success) async* {
        yield ImagesSuccess(success);
      });
    }
  }

  @override
  ImagesState get initialState => ImagesInitial();

  loadImages(
      {@required String query,
      @required int pageNumber,
      int imagesPerPage = 5}) {
    add(LoadImagesEvent(
        query: query, pageNumber: pageNumber, itemsPerPage: imagesPerPage));
  }
}

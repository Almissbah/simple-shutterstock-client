import 'package:flutter/material.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shutterstock_client/core/usecases/usecase.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/features/images/domain/repos/images_repository.dart';

/// This use case returns [ImagesPage] when success and [Failure] object when fail.
class LoadImagesPage extends UseCase<ImagesPage, Params> {
  final ImagesRepository imagesRepository;

  LoadImagesPage({@required this.imagesRepository});
  @override
  Future<Either<Failure, ImagesPage>> call(Params params) {
    return imagesRepository.loadImages(
        query: params.query,
        pageNumber: params.pageNumber,
        imagesPerPage: params.imagesPerPage);
  }
}

class Params {
  final String query;
  final int pageNumber;
  final int imagesPerPage;

  Params(
      {@required this.query,
      @required this.pageNumber,
      this.imagesPerPage = 5});
}

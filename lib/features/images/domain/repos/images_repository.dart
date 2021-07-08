import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';

abstract class ImagesRepository {
  Future<Either<Failure, ImagesPage>> loadImages(
      {@required String query,
      @required int pageNumber,
      @required int imagesPerPage});
}

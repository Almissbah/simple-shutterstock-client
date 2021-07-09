import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shutterstock_client/core/network/network_info.dart';
import 'package:shutterstock_client/core/utils/mock_utils.dart';
import 'package:shutterstock_client/features/images/data/datasources/images_remote_data_source.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shutterstock_client/features/images/domain/repos/images_repository.dart';
import 'package:shutterstock_client/injection.dart';

@Singleton(as: ImagesRepository, env: [Env.test])
class ImagesRepositoryMock extends ImagesRepository {
  @override
  Future<Either<Failure, ImagesPage>> loadImages(
      {String query, int pageNumber, int imagesPerPage}) async {
    return Right(MockUtils.getImagePage());
  }
}

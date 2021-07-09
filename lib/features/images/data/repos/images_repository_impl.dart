import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shutterstock_client/core/network/network_info.dart';
import 'package:shutterstock_client/features/images/data/datasources/images_remote_data_source.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shutterstock_client/features/images/domain/repos/images_repository.dart';

import '../../../../injection.dart';


@Singleton(as: ImagesRepository,env: [Env.prod])
class ImagesRepositoryImpl extends ImagesRepository {
  final ImagesRemoteDataSource imagesRemoteDataSource;
  final NetworkInfo networkInfo;

  ImagesRepositoryImpl(
      {@required this.imagesRemoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, ImagesPage>> loadImages(
      {String query, int pageNumber, int imagesPerPage}) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await imagesRemoteDataSource.loadImages(
            query: query, pageNumber: pageNumber, imagesPerPage: imagesPerPage);

        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}

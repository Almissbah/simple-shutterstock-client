import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';

abstract class ImagesRemoteDataSource {
  Future<ImagesPage> loadImages(
      {String query, int pageNumber, int imagesPerPage});
}

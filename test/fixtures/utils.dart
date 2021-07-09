import 'package:shutterstock_client/features/images/data/models/images_api_response.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';

class TestUtils {
  static ImagesPage getImagesPage() {
    return ImagesPage(
        pageNumber: 1,
        imagesData: [
          ImageData(
              aspect: 1.4997,
              assetsData: ImageAssetsData(
                  hugeThumb: ImageAsset(
                      url:
                          'https://image.shutterstock.com/image-photo/forest-road-under-sunset-sunbeams-260nw-228722404.jpg',
                      height: 260,
                      width: 390),
                  largeThumb: ImageAsset(
                      url:
                          'https://thumb7.shutterstock.com/thumb_large/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 100,
                      width: 150),
                  preview1000: ImageAsset(
                      url:
                          'https://ak.picdn.net/shutterstock/photos/228722404/watermark_1000/007874edefea7d358134ea6c9e29324f/preview_1000-228722404.jpg',
                      height: 667,
                      width: 1000),
                  preview1500: ImageAsset(
                      url:
                          'https://image.shutterstock.com/z/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 1000,
                      width: 1500),
                  preview: ImageAsset(
                      url:
                          'https://image.shutterstock.com/display_pic_with_logo/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 300,
                      width: 450),
                  smallThumb: ImageAsset(
                      url:
                          'https://thumb7.shutterstock.com/thumb_small/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 67,
                      width: 100)),
              contributor: Contributor('708811'),
              description:
                  'Forest Road Under Sunset Sunbeams. Lane Running Through The Autumn Deciduous Forest At Dawn Or Sunrise. Toned Instant Photo',
              id: '228722404',
              imageType: 'photo',
              mediaType: 'image')
        ],
        imagesPerPage: 1,
        searchId: "pH4mTr97r-nHSY6tUrOeVA",
        totalCount: 3207000);
    ;
  }

  static ImagesApiResponse getImagesApiResponse() {
    return ImagesApiResponse(
        pageNumber: 1,
        imagesData: [
          ImageDataModel(
              aspect: 1.4997,
              assetsData: ImageAssetsDataModel(
                  hugeThumb: ImageAssetModel(
                      url:
                          'https://image.shutterstock.com/image-photo/forest-road-under-sunset-sunbeams-260nw-228722404.jpg',
                      height: 260,
                      width: 390),
                  largeThumb: ImageAssetModel(
                      url:
                          'https://thumb7.shutterstock.com/thumb_large/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 100,
                      width: 150),
                  preview1000: ImageAssetModel(
                      url:
                          'https://ak.picdn.net/shutterstock/photos/228722404/watermark_1000/007874edefea7d358134ea6c9e29324f/preview_1000-228722404.jpg',
                      height: 667,
                      width: 1000),
                  preview1500: ImageAssetModel(
                      url:
                          'https://image.shutterstock.com/z/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 1000,
                      width: 1500),
                  preview: ImageAssetModel(
                      url:
                          'https://image.shutterstock.com/display_pic_with_logo/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 300,
                      width: 450),
                  smallThumb: ImageAssetModel(
                      url:
                          'https://thumb7.shutterstock.com/thumb_small/708811/228722404/stock-photo-forest-road-under-sunset-sunbeams-lane-running-through-the-autumn-deciduous-forest-at-dawn-or-228722404.jpg',
                      height: 67,
                      width: 100)),
              contributor: ContributorModel('708811'),
              description:
                  'Forest Road Under Sunset Sunbeams. Lane Running Through The Autumn Deciduous Forest At Dawn Or Sunrise. Toned Instant Photo',
              id: '228722404',
              imageType: 'photo',
              mediaType: 'image')
        ],
        imagesPerPage: 1,
        searchId: "pH4mTr97r-nHSY6tUrOeVA",
        totalCount: 3207000);
  }
}

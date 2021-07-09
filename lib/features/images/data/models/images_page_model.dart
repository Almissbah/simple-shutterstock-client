import 'package:flutter/material.dart';
import 'package:shutterstock_client/features/images/data/models/images_api_response.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';

class ImagesPageModel extends ImagesPage {
  ImagesPageModel(
      {@required int pageNumber,
      @required int imagesPerPage,
      @required int totalCount,
      @required String searchId,
      @required List<ImageData> imagesData})
      : super(
            imagesData: imagesData,
            imagesPerPage: imagesPerPage,
            pageNumber: pageNumber,
            searchId: searchId,
            totalCount: totalCount);

            
  factory ImagesPageModel.fromApiResonse(ImagesApiResponse response) {
    List<ImageData> imagesData = response.imagesData.map((e) {
      ImageAsset hugeThumb = ImageAsset(
          url: e.assetsData.hugeThumb.url,
          height: e.assetsData.hugeThumb.height,
          width: e.assetsData.hugeThumb.width);
      ImageAsset largeThumb = ImageAsset(
          url: e.assetsData.largeThumb.url,
          height: e.assetsData.largeThumb.height,
          width: e.assetsData.largeThumb.width);
      ImageAsset preview1000 = ImageAsset(
          url: e.assetsData.preview1000.url,
          height: e.assetsData.preview1000.height,
          width: e.assetsData.preview1000.width);
      ImageAsset preview1500 = ImageAsset(
          url: e.assetsData.preview1500.url,
          height: e.assetsData.preview1500.height,
          width: e.assetsData.preview1500.width);
      ImageAsset preview = ImageAsset(
          url: e.assetsData.preview.url,
          height: e.assetsData.preview.height,
          width: e.assetsData.preview.width);
      ImageAsset smallThumb = ImageAsset(
          url: e.assetsData.smallThumb.url,
          height: e.assetsData.smallThumb.height,
          width: e.assetsData.smallThumb.width);
      ImageAssetsData assetsData = ImageAssetsData(
          hugeThumb: hugeThumb,
          largeThumb: largeThumb,
          preview1000: preview1000,
          preview1500: preview1500,
          preview: preview,
          smallThumb: smallThumb);
      Contributor contributor = Contributor(e.contributor.id);

      return ImageData(
          aspect: e.aspect,
          assetsData: assetsData,
          contributor: contributor,
          description: e.description,
          id: e.id,
          imageType: e.imageType,
          mediaType: e.mediaType);
    }).toList();

    return ImagesPageModel(
        searchId: response.searchId,
        imagesData: imagesData,
        imagesPerPage: response.imagesPerPage,
        pageNumber: response.pageNumber,
        totalCount: response.totalCount);
  }
}

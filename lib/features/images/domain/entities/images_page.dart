import 'package:flutter/material.dart';

@immutable
class ImagesPage {
  /// The current page number.
  final int pageNumber;

  /// The total count of images in the current page.
  final int imagesPerPage;

  /// Total count of images in all pages.
  final int totalCount;

  /// Search identifier.
  final String searchId;

  /// List of images info.
  final List<ImageData> imagesData;

  ImagesPage(
      {@required this.pageNumber,
      @required this.imagesPerPage,
      @required this.totalCount,
      @required this.searchId,
      @required this.imagesData});
}

@immutable
class ImageData {
  /// Image id.
  final String id;

  /// Image aspect ratio.
  final double aspect;

  /// Image description.
  final String description;

  /// Image type.
  final String imageType;

  /// Image description.
  final String mediaType;

  /// Image description.
  final ImageAssetsData assetsData;

  /// Image description.
  final Contributor contributor;

  ImageData(
      {@required this.id,
      @required this.aspect,
      @required this.description,
      @required this.imageType,
      @required this.mediaType,
      @required this.assetsData,
      @required this.contributor});
}

@immutable
class ImageAssetsData {
  /// Scaled until the larger dimension is 450px, watermarked.
  final ImageAsset preview;

  /// Scaled until the larger dimension is 100px, no watermark.
  final ImageAsset smallThumb;

  /// Scaled until the larger dimension is 150px, no watermark.
  final ImageAsset largeThumb;

  /// Scaled to 260px in height, no watermark.
  final ImageAsset hugeThumb;

  ///  Scaled until the larger dimension is 1000px, watermarked.
  final ImageAsset preview1000;

  /// Scaled until the larger dimension is 1500px, watermarked.
  final ImageAsset preview1500;

  ImageAssetsData(
      {@required this.preview,
      @required this.smallThumb,
      @required this.largeThumb,
      @required this.hugeThumb,
      @required this.preview1000,
      @required this.preview1500});
}

@immutable
class ImageAsset {
  /// Image height in px.
  final int height;

  /// Image width in px.
  final int width;

  /// Image URL.
  final String url;

  ImageAsset({this.height, this.width, @required this.url});
}

@immutable
class Contributor {
  /// Contributor identifier.
  final String id;

  Contributor(this.id);
}

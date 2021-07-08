import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ImagesPage extends Equatable {
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

  @override
  List<Object> get props =>
      [pageNumber, imagesPerPage, totalCount, searchId, imagesData];
}

@immutable
class ImageData extends Equatable {
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

  @override
  List<Object> get props =>
      [id, aspect, description, imageType, mediaType, assetsData, contributor];
}

@immutable
class ImageAssetsData extends Equatable {
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

  @override
  List<Object> get props =>
      [preview, smallThumb, largeThumb, hugeThumb, preview1000, preview1500];
}

@immutable
class ImageAsset extends Equatable {
  /// Image height in px.
  final int height;

  /// Image width in px.
  final int width;

  /// Image URL.
  final String url;

  ImageAsset({this.height, this.width, @required this.url});

  @override
  List<Object> get props => [height, width, url];
}

@immutable
class Contributor extends Equatable {
  /// Contributor identifier.
  final String id;

  Contributor(this.id);
  @override
  List<Object> get props => [id];
}

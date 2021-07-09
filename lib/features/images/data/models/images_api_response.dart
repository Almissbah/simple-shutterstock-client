import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'images_api_response.g.dart';

@JsonSerializable()
class ImagesApiResponse extends Equatable {
  @JsonKey(name: 'page')
  final int pageNumber;
  @JsonKey(name: 'per_page')
  final int imagesPerPage;
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'search_id')
  final String searchId;
  @JsonKey(name: 'data')
  final List<ImageDataModel> imagesData;

  ImagesApiResponse(
      {@required this.pageNumber,
      @required this.imagesPerPage,
      @required this.totalCount,
      @required this.searchId,
      @required this.imagesData});

  factory ImagesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesApiResponseToJson(this);

  @override
  List<Object> get props =>
      [pageNumber, imagesPerPage, totalCount, searchId, imagesData];
}

@JsonSerializable()
class ImageDataModel extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'aspect')
  final double aspect;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'image_type')
  final String imageType;
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'assets')
  final ImageAssetsDataModel assetsData;
  @JsonKey(name: 'contributor')
  final ContributorModel contributor;

  ImageDataModel(
      {@required this.id,
      @required this.aspect,
      @required this.description,
      @required this.imageType,
      @required this.mediaType,
      @required this.assetsData,
      @required this.contributor});

  factory ImageDataModel.fromJson(Map<String, dynamic> json) =>
      _$ImageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataModelToJson(this);

  @override
  List<Object> get props =>
      [id, aspect, description, imageType, mediaType, assetsData, contributor];
}

@JsonSerializable()
class ImageAssetsDataModel extends Equatable {
  @JsonKey(name: 'preview')
  final ImageAssetModel preview;
  @JsonKey(name: 'small_thumb')
  final ImageAssetModel smallThumb;
  @JsonKey(name: 'large_thumb')
  final ImageAssetModel largeThumb;
  @JsonKey(name: 'huge_thumb')
  final ImageAssetModel hugeThumb;
  @JsonKey(name: 'preview_1000')
  final ImageAssetModel preview1000;
  @JsonKey(name: 'preview_1500')
  final ImageAssetModel preview1500;

  ImageAssetsDataModel(
      {@required this.preview,
      @required this.smallThumb,
      @required this.largeThumb,
      @required this.hugeThumb,
      @required this.preview1000,
      @required this.preview1500});

  factory ImageAssetsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ImageAssetsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAssetsDataModelToJson(this);

  @override
  List<Object> get props =>
      [preview, smallThumb, largeThumb, hugeThumb, preview1000, preview1500];
}

@JsonSerializable()
class ImageAssetModel extends Equatable {
  @JsonKey(name: 'height')
  final int height;
  @JsonKey(name: 'width')
  final int width;
  @JsonKey(name: 'url')
  final String url;

  ImageAssetModel({this.height, this.width, @required this.url});

  factory ImageAssetModel.fromJson(Map<String, dynamic> json) =>
      _$ImageAssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAssetModelToJson(this);

  @override
  List<Object> get props => [height, width, url];
}

@JsonSerializable()
class ContributorModel extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  ContributorModel(this.id);
  factory ContributorModel.fromJson(Map<String, dynamic> json) =>
      _$ContributorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorModelToJson(this);
  @override
  List<Object> get props => [id];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesApiResponse _$ImagesApiResponseFromJson(Map<String, dynamic> json) {
  return ImagesApiResponse(
    pageNumber: json['page'] as int,
    imagesPerPage: json['per_page'] as int,
    totalCount: json['total_count'] as int,
    searchId: json['search_id'] as String,
    imagesData: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ImageDataModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ImagesApiResponseToJson(ImagesApiResponse instance) =>
    <String, dynamic>{
      'page': instance.pageNumber,
      'per_page': instance.imagesPerPage,
      'total_count': instance.totalCount,
      'search_id': instance.searchId,
      'data': instance.imagesData,
    };

ImageDataModel _$ImageDataModelFromJson(Map<String, dynamic> json) {
  return ImageDataModel(
    id: json['id'] as String,
    aspect: (json['aspect'] as num)?.toDouble(),
    description: json['description'] as String,
    imageType: json['image_type'] as String,
    mediaType: json['media_type'] as String,
    assetsData: json['assets'] == null
        ? null
        : ImageAssetsDataModel.fromJson(json['assets'] as Map<String, dynamic>),
    contributor: json['contributor'] == null
        ? null
        : ContributorModel.fromJson(
            json['contributor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImageDataModelToJson(ImageDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aspect': instance.aspect,
      'description': instance.description,
      'image_type': instance.imageType,
      'media_type': instance.mediaType,
      'assets': instance.assetsData,
      'contributor': instance.contributor,
    };

ImageAssetsDataModel _$ImageAssetsDataModelFromJson(Map<String, dynamic> json) {
  return ImageAssetsDataModel(
    preview: json['preview'] == null
        ? null
        : ImageAssetModel.fromJson(json['preview'] as Map<String, dynamic>),
    smallThumb: json['small_thumb'] == null
        ? null
        : ImageAssetModel.fromJson(json['small_thumb'] as Map<String, dynamic>),
    largeThumb: json['large_thumb'] == null
        ? null
        : ImageAssetModel.fromJson(json['large_thumb'] as Map<String, dynamic>),
    hugeThumb: json['huge_thumb'] == null
        ? null
        : ImageAssetModel.fromJson(json['huge_thumb'] as Map<String, dynamic>),
    preview1000: json['preview_1000'] == null
        ? null
        : ImageAssetModel.fromJson(
            json['preview_1000'] as Map<String, dynamic>),
    preview1500: json['preview_1500'] == null
        ? null
        : ImageAssetModel.fromJson(
            json['preview_1500'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImageAssetsDataModelToJson(
        ImageAssetsDataModel instance) =>
    <String, dynamic>{
      'preview': instance.preview,
      'small_thumb': instance.smallThumb,
      'large_thumb': instance.largeThumb,
      'huge_thumb': instance.hugeThumb,
      'preview_1000': instance.preview1000,
      'preview_1500': instance.preview1500,
    };

ImageAssetModel _$ImageAssetModelFromJson(Map<String, dynamic> json) {
  return ImageAssetModel(
    height: json['height'] as int,
    width: json['width'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ImageAssetModelToJson(ImageAssetModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
    };

ContributorModel _$ContributorModelFromJson(Map<String, dynamic> json) {
  return ContributorModel(
    json['id'] as String,
  );
}

Map<String, dynamic> _$ContributorModelToJson(ContributorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

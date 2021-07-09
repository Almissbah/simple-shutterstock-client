// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ImagesApiService implements ImagesApiService {
  _ImagesApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.shutterstock.com/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<ImagesApiResponse>> fetchImagesPage(
      {query, pageNumber, imagesPerPage}) async {
    ArgumentError.checkNotNull(query, 'query');
    ArgumentError.checkNotNull(pageNumber, 'pageNumber');
    ArgumentError.checkNotNull(imagesPerPage, 'imagesPerPage');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'query': query,
      r'page': pageNumber,
      r'per_page': imagesPerPage
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/images/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ImagesApiResponse.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}

import 'package:dio/dio.dart';
import 'package:pokedex_sona/core/shared/url.dart';

class NetworkClient {
  final Dio _dio;
  final Url url;
  NetworkClient(this._dio, {required this.url}) {
    _dio.options = BaseOptions(
      contentType: 'application/json',
      baseUrl: url.baseUrl,
    );
  }

  get dio => _dio;
}

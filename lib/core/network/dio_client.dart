import '../../../../core/error/api_error_handler.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../utils/constants/const.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;
  final AppPrefs _appPrefs;

  DioClient(this._dio, this._appPrefs) {
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "x-api-key":
            "SIv5q09xLI689LNoALEh2D4Af/TsFkoypEMd/2XdtvGPfKHmU6HENZuuBgaBQKXM",
        "appKey":
            "SIv5q09xLI689LNoALEh2D4Af/TsFkoypEMd/2XdtvGPfKHmU6HENZuuBgaBQKXM",
        "Accept-Language": "en",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );

    _dio.options = options;

    String token = _appPrefs.get(AppPrefsKeys.token) ?? "";
    if (token.isNotEmpty) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    } else {
      _dio.options.headers.remove("Authorization");
    }

    if (Const.kDebug) _dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> post({
    required String url,
    FormData? data,
    Map<String, dynamic>? queryParameters,
    bool cancelToken = false,
  }) async {
    updateHeaders();

    try {
      if (cancelToken) _dio.options.headers["Authorization"] = null;
      Response response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw ApiErrorHandler.getMessages(e);
    } catch (e) {
      throw ApiErrorHandler.getMessages(e);
    }
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    updateHeaders();
    return await _dio.get(
      url,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put({
    required String url,
    required var data,
    Map<String, dynamic>? queryParameters,
  }) async {
    updateHeaders();
    try {
      Response response = await _dio.put(
        url,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw ApiErrorHandler.getMessages(e);
    } catch (e) {
      throw ApiErrorHandler.getMessages(e);
    }
  }

  Future<Response> delete({
    required String url,
    required var data,
    Map<String, dynamic>? queryParameters,
  }) async {
    updateHeaders();
    try {
      Response response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        data: data,
      );

      return response;
    } on DioException catch (e) {
      throw ApiErrorHandler.getMessages(e);
    } catch (e) {
      throw ApiErrorHandler.getMessages(e);
    }
  }

  void updateHeaders() {
    String lang =
        _appPrefs.get(AppPrefsKeys.locale, defaultValue: "ar") ?? "ar";

    _dio.options.headers["Accept-Language"] = lang;
  }
}

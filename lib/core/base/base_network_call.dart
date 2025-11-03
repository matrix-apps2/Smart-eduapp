import '../../../../core/error/api_error_handler.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../utils/debug/echo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  Future<Either<ErrorModel, Response>> call({
    required Map<String, dynamic> data,
    required String url,
    required NetworkCallType type,
    FormData? formData,
    bool cancelToken = false,
  }) async {
    DioClient dioClient = getIt<DioClient>();
    late Response response;
    try {
      switch (type) {
        case NetworkCallType.get:
          response = await dioClient.get(url: url, queryParameters: data);
          break;
        case NetworkCallType.post:
          response = await dioClient.post(
              url: url, queryParameters: data, data: formData);
          break;
        case NetworkCallType.put:
          response = await dioClient.put(url: url, data: data);
          break;
        case NetworkCallType.delete:
          response = await dioClient.delete(url: url, data: data);
          break;
      }
      return Right(response);
    } catch (e) {
      kEchoError("$e", name: "NetworkClient");
      if (e is ErrorModel) return Left(e);
      ReadableFailure readableFailure = ApiErrorHandler.getMessages(e);
      kEchoError(readableFailure.message, name: "NetworkClient message");
      return Left(readableFailure);
    }
  }
}

enum NetworkCallType { get, post, put, delete }

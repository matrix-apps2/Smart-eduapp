import '../../../../core/error/error_model.dart';
import '../../../../utils/debug/echo.dart';
import '../../../../utils/translations/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiErrorHandler {
  static ReadableFailure getMessages(error) {
    if (error is DioException &&
        error.response != null &&
        error.response!.data != null) {
      kEchoError("${error.response.toString()}}", name: 'ReadableFailure');
      try {
        if (error.response!.data['message'] != null) {
          return ReadableFailure(message: error.response!.data['message']);
        }
        return ReadableFailure(
            message: Strings().somethingWentWrong +
                (kDebugMode ? "\n${error.response!.data.toString()}" : ""));
      } on FormatException catch (e) {
        kEchoError("format exception: ${e.toString()}",
            name: "catch readable failure");
      } catch (e) {
        kEchoError("catch exception: ${e.toString()}",
            name: "catch readable failure");
      }
    }

    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              break;
            case DioExceptionType.connectionTimeout:
              return ReadableFailure(message: Strings().connectionTimeout);
            case DioExceptionType.receiveTimeout:
              return ReadableFailure(message: Strings().receiveTimeout);
            case DioExceptionType.sendTimeout:
              return ReadableFailure(message: Strings().sendTimeout);
            case DioExceptionType.unknown:
              return ReadableFailure(message: Strings().noInternetConnection);
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  return ReadableFailure(message: Strings().badRequest);
                case 401:
                  return ReadableFailure(message: Strings().unauthorized);
                case 404:
                  return ReadableFailure(message: Strings().notFound);
                case 500:
                  return ReadableFailure(
                      message: Strings().internalServerError);
                case 503:
                  return ReadableFailure(message: Strings().serviceUnavailable);
                default:
              }
              break;
            case DioExceptionType.badCertificate:
              return ReadableFailure(message: Strings().badCertificate);
            case DioExceptionType.connectionError:
              return ReadableFailure(message: Strings().connectionError);
          }
        } else {
          kEchoError("error is not dio error ${error.toString()}",
              name: "apiErrorHandler:6 getMessages");
        }
      } on FormatException catch (e) {
        kEchoError("format exception: ${e.message}",
            name: "apiErrorHandler:7 getMessages");
      } catch (e) {
        kEchoError("catch exception: ${e.toString()}",
            name: "apiErrorHandler:8 getMessages");
      }
    } else {}
    return ReadableFailure(message: Strings().somethingWentWrong);
  }
}

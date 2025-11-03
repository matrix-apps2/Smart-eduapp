import 'dart:async';

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/notification/data/models/notification_count_response.dart';
import '../../../../modules/notification/data/models/notification_model.dart';
import '../../../../modules/notification/domain/repositories/notification_repository.dart';
import '../../../../modules/notification/domain/usecases/notification/notification_mark_as_seen_usecase.dart';
import '../../../../modules/notification/domain/usecases/notification/notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImp implements NotificationRepository {
  final NetworkClient networkClient;
  NotificationRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, List<NotificationModel>>> getNotification(
      NotificationParams parameters) async {
    String url = EndPoints.getNotifications;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();
    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        List<NotificationModel> list = List<NotificationModel>.from(
            baseResponse.data.map((x) => NotificationModel.fromJson(x)));
        return Right(list);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, void>> setNotificationAsSeen(
      NotificationMarkAsSeenParams parameters) async {
    String url = EndPoints.markNotificationAsSeen;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();
    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        return const Right(null);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, NotificationCountResponse>>
      getNotificationCount() async {
    String url = EndPoints.settings;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = {};
    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        NotificationCountResponse response =
            NotificationCountResponse.fromJson(baseResponse.data);
        return Right(response);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/layout/data/models/settings_response.dart';
import '../../../../modules/layout/domain/repositories/settings_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SettingRepositoryImp implements SettingRepositories {
  final NetworkClient networkClient;
  SettingRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, SettingsResponse>> getSetting() async {
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
        SettingsResponse settingResponse = SettingsResponse.fromJson(r.data);
        return Right(settingResponse);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

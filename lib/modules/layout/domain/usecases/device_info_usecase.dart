import 'dart:io';

import '../../../../core/base/base_response.dart';
import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/layout/domain/repositories/settings_repo.dart';
import '../../../../utils/public_methods.dart';
import 'package:dartz/dartz.dart';

class DeviceInfoUseCase extends BaseUseCase<BaseResponse, DeviceInfoParams> {
  final SettingRepositories _settingsRepository;

  DeviceInfoUseCase(this._settingsRepository);

  @override
  Future<Either<ErrorModel, BaseResponse>> call(
      DeviceInfoParams parameters) async {
    String deviceInfo = await getInfoDeviceId('');
    parameters.deviceId = deviceInfo;
    parameters.brand = await getInfoBrand();
    parameters.model = await getInfoModel();
    parameters.platform = Platform.isAndroid ? 'android' : 'ios';
    return throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, BaseResponse>> callTest(
      DeviceInfoParams parameters) {
    throw UnimplementedError();
  }
}

class DeviceInfoParams {
  String? fcmToken;
  String? deviceId;
  String? brand;
  String? model;
  String? platform;

  DeviceInfoParams({
    this.deviceId,
    this.fcmToken,
    this.brand,
    this.model,
    this.platform,
  });

  Map<String, dynamic> toJSon() {
    return {
      "fcm_token": fcmToken,
      "deviceId": deviceId,
      "brand": brand,
      "model": model,
      "platform": platform,
    };
  }
}

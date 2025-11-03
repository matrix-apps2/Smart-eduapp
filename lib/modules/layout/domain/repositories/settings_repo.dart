import '../../../../core/error/error_model.dart';
import '../../../../modules/layout/data/models/settings_response.dart';
import 'package:dartz/dartz.dart';

abstract class SettingRepositories {
  Future<Either<ErrorModel, SettingsResponse>> getSetting();
}

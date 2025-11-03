import '../../../../core/error/error_model.dart';
import '../../../../modules/layout/data/models/settings_response.dart';
import '../../../../modules/layout/domain/repositories/settings_repo.dart';
import 'package:dartz/dartz.dart';

class SettingsUseCase {
  final SettingRepositories _settingsRepository;

  SettingsUseCase(this._settingsRepository);

  Future<Either<ErrorModel, SettingsResponse>> getSettings() async {
    return _settingsRepository.getSetting();
  }
}

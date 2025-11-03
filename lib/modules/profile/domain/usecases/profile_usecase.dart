import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../../modules/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileUseCase extends BaseUseCase<UserModel, NoParameters> {
  final ProfileRepository _campaignRepository;

  ProfileUseCase(this._campaignRepository);
  @override
  Future<Either<ErrorModel, UserModel>> call(NoParameters parameters) async {
    return await _campaignRepository.getProfile();
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(NoParameters parameters) {
    throw UnimplementedError();
  }
}

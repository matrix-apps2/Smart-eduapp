import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../core/model/user.dart';
import 'package:dartz/dartz.dart';
import '../../../../../modules/auth/domain/repositories/auth_repository.dart';

class ForgetPasswordUseCase
    extends BaseUseCase<UserModel, ForgetPasswordParams> {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  @override
  Future<Either<ErrorModel, UserModel>> call(
      ForgetPasswordParams parameters) async {
    return await repository.forgetPassword(parameters);
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(
      ForgetPasswordParams parameters) {
    throw UnimplementedError();
  }
}

class ForgetPasswordParams {
  final String type;
  final String? email;
  final String? phone;
  final String? countryId;

  ForgetPasswordParams({
    required this.type,
    this.email,
    this.phone,
    this.countryId,
  });

  toJson() {
    return {
      'type': type,
      'email': email,
      'phone': phone,
      'country_id': countryId,
    };
  }
}

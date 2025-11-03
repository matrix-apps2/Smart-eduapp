import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<UserModel, LoginParams> {
  final AuthRepository repositories;

  LoginUseCase(this.repositories);

  @override
  Future<Either<ErrorModel, UserModel>> call(LoginParams parameters) async {
    return await repositories.login(parameters);
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(LoginParams parameters) {
    throw UnimplementedError();
  }
}

class LoginParams {
  final String phone;
  final String password;
  final String phoneCountryId;

  LoginParams({
    required this.phone,
    required this.password,
    required this.phoneCountryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone_country_id': phoneCountryId,
      'phone': phone,
      'password': password,
    };
  }
}

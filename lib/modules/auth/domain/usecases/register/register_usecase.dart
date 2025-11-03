import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../core/model/user.dart';
import '../../../../../modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends BaseUseCase<UserModel, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<ErrorModel, UserModel>> call(RegisterParams parameters) async {
    return await repository.register(parameters);
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(RegisterParams parameters) {
    throw UnimplementedError();
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String phoneCountryId;

  RegisterParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.phoneCountryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_country_id': phoneCountryId,
      'phone': phone,
      'password': password,
    };
  }
}


// Compare this snippet from lib/modules/auth/domain/usecases/verify_account/verify_account_usecase.dart:







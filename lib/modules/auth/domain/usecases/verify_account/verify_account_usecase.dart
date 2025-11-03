import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../core/model/user.dart';
import '../../../../../modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyAccountUseCase extends BaseUseCase<UserModel, VerifyAccountParams> {
  final AuthRepository repository;

  VerifyAccountUseCase(this.repository);

  @override
  Future<Either<ErrorModel, UserModel>> call(
      VerifyAccountParams parameters) async {
    return await repository.verifyAccount(parameters);
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(
      VerifyAccountParams parameters) {
    throw UnimplementedError();
  }
}

class VerifyAccountParams {
  String otp;

  VerifyAccountParams({required this.otp});
  toJson() => {"otp": otp};
}

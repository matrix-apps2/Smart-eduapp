import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../core/model/user.dart';
import '../../../../../modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase extends BaseUseCase<UserModel, ResetPasswordParams> {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  @override
  Future<Either<ErrorModel, UserModel>> call(
      ResetPasswordParams parameters) async {
    return await repository.resetPassword(parameters);
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(
      ResetPasswordParams parameters) {
    throw UnimplementedError();
  }
}

class ResetPasswordParams {
  String otp;

  ResetPasswordParams({required this.otp});
  toJson() => {"otp": otp};
}

import '../../../../../core/base/base_response.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final AuthRepository repositories;

  ChangePasswordUseCase(this.repositories);

  Future<Either<ErrorModel, BaseResponse>> call(
      {required String password}) async {
    ChangePasswordRequest requestData =
        ChangePasswordRequest(newPassword: password);
    return await repositories.changePassword(requestData);
  }
}

class ChangePasswordRequest {
  final String newPassword;

  ChangePasswordRequest({
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': newPassword,
      'password_confirmation': newPassword,
    };
  }
}

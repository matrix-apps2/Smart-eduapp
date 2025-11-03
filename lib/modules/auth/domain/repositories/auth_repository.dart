import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../modules/auth/domain/usecases/login_usecase.dart';
import '../../../../modules/auth/domain/usecases/password/change_password_usecase.dart';
import '../../../../modules/auth/domain/usecases/password/forget_password_usecas.dart';
import '../../../../modules/auth/domain/usecases/password/reset_password_usecase.dart';
import '../../../../modules/auth/domain/usecases/register/register_usecase.dart';
import '../../../../modules/auth/domain/usecases/verify_account/send_otp_usecase.dart';
import '../../../../modules/auth/domain/usecases/verify_account/verify_account_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<ErrorModel, UserModel>> login(LoginParams loginRequest);
  Future<Either<ErrorModel, UserModel>> register(RegisterParams parameters);

  Future<Either<ErrorModel, BaseResponse>> changePassword(
      ChangePasswordRequest changePasswordRequest);
  Future<Either<ErrorModel, UserModel>> resetPassword(
      ResetPasswordParams parameters);
  Future<Either<ErrorModel, UserModel>> forgetPassword(
      ForgetPasswordParams parameters);
  Future<Either<ErrorModel, UserModel>> verifyAccount(
      VerifyAccountParams parameters);

  Future<Either<ErrorModel, bool>> sendOtp(SendOtpParams parameters);
}

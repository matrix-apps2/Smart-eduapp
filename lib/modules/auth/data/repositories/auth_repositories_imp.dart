import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/auth/domain/repositories/auth_repository.dart';
import '../../../../modules/auth/domain/usecases/login_usecase.dart';
import '../../../../modules/auth/domain/usecases/password/change_password_usecase.dart';
import '../../../../modules/auth/domain/usecases/password/forget_password_usecas.dart';
import '../../../../modules/auth/domain/usecases/password/reset_password_usecase.dart';
import '../../../../modules/auth/domain/usecases/register/register_usecase.dart';
import '../../../../modules/auth/domain/usecases/verify_account/send_otp_usecase.dart';
import '../../../../modules/auth/domain/usecases/verify_account/verify_account_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoriesImp implements AuthRepository {
  final NetworkClient networkClient;
  AuthRepositoriesImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, UserModel>> login(LoginParams parameters) async {
    String url = EndPoints.login;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        UserModel data = UserModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> register(
      RegisterParams parameters) async {
    String url = EndPoints.register;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        UserModel data = UserModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> verifyAccount(
      VerifyAccountParams parameters) async {
    String url = EndPoints.verifyAccount;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        UserModel data = UserModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, BaseResponse>> changePassword(
      ChangePasswordRequest parameters) async {
    String url = EndPoints.changePassword;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }

        return Right(baseResponse);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, bool>> sendOtp(SendOtpParams parameters) async {
    String url = EndPoints.sendOTP;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);
        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        return const Right(true);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> forgetPassword(
      ForgetPasswordParams parameters) async {
    String url = EndPoints.forgetPassword;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);
        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        UserModel data = UserModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> resetPassword(
      ResetPasswordParams parameters) async {
    String url = EndPoints.resetPassword;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = parameters.toJson();

    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        UserModel data = UserModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

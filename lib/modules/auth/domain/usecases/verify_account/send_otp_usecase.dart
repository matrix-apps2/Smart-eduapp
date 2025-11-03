import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SendOtpUseCase extends BaseUseCase<bool, SendOtpParams> {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  @override
  Future<Either<ErrorModel, bool>> call(SendOtpParams parameters) async {
    return await repository.sendOtp(parameters);
  }

  @override
  Future<Either<ErrorModel, bool>> callTest(SendOtpParams parameters) {
    throw UnimplementedError();
  }
}

class SendOtpParams {
  String phone;
  String phoneCountryId;

  SendOtpParams({required this.phone, required this.phoneCountryId});

  toJson() => {
        "phone": phone,
        "phone_country_id": phoneCountryId,
      };
}

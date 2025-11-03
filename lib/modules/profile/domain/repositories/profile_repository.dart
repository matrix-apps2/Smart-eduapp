import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<ErrorModel, UserModel>> getProfile();
}

import '../../../../core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../modules/policy/data/models/policy_model.dart';

abstract class PolicyRepository {
  Future<Either<ErrorModel, PolicyModel>> getPolicy();
}

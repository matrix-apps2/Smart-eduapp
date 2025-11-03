import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/policy/data/models/policy_model.dart';
import '../../../../../modules/policy/domain/repositories/policy_repository.dart';
import 'package:dartz/dartz.dart';

class PolicyUseCase extends BaseUseCase<PolicyModel, PolicyParams> {
  final PolicyRepository repository;

  PolicyUseCase(this.repository);

  @override
  Future<Either<ErrorModel, PolicyModel>> call(PolicyParams parameters) async {
    return await repository.getPolicy();
  }

  @override
  Future<Either<ErrorModel, PolicyModel>> callTest(
      PolicyParams parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(PolicyModel(
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        title: ""));
  }
}

class PolicyParams {
  toJson() {
    return {};
  }
}

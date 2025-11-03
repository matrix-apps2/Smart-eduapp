import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/packages/data/models/packages_model.dart';
import '../../../../../modules/packages/domain/repositories/packages_repository.dart';
import 'package:dartz/dartz.dart';

class PackagesUseCase extends BaseUseCase<List<PackagesModel>, PackagesParams> {
  final PackagesRepository repository;

  PackagesUseCase(this.repository);

  @override
  Future<Either<ErrorModel, List<PackagesModel>>> call(
      PackagesParams parameters) async {
    return await repository.getPackages();
  }

  @override
  Future<Either<ErrorModel, List<PackagesModel>>> callTest(
      PackagesParams parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    List<PackagesModel> list = List<PackagesModel>.generate(
      3,
      (index) => PackagesModel(
        id: index,
        name: 'Package ${index + 1}',
        description:
            'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        price: "${300 * (index + 1)} KWD ",
        duration: "${index + 1} Month",
        features: [
          "Feature 1 Lorem ipsum dolor sit amet",
          "Feature 2 Lorem ipsum dolor sit amet",
          "Feature 3 Lorem ipsum dolor sit amet",
          "Feature 4 Lorem ipsum dolor sit amet",
          "Feature 5 Lorem ipsum dolor sit amet",
        ],
      ),
    );
    return Right(list);
  }
}

class PackagesParams {
  toJson() {
    return {};
  }
}

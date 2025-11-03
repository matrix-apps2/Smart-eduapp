import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/about/data/models/about_model.dart';
import '../../../../../modules/about/domain/repositories/about_repository.dart';
import 'package:dartz/dartz.dart';

class AboutUseCase extends BaseUseCase<AboutModel, AboutParams> {
  final AboutRepository repository;

  AboutUseCase(this.repository);

  @override
  Future<Either<ErrorModel, AboutModel>> call(AboutParams parameters) async {
    return await repository.getAbout();
  }

  @override
  Future<Either<ErrorModel, AboutModel>> callTest(
      AboutParams parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(AboutModel(
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."));
  }
}

class AboutParams {
  toJson() {
    return {};
  }
}

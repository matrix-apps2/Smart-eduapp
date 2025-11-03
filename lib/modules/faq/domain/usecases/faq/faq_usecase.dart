import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/faq/data/models/faq_model.dart';
import '../../../../../modules/faq/domain/repositories/faq_repository.dart';
import 'package:dartz/dartz.dart';

class FaqUseCase extends BaseUseCase<List<FaqModel>, FaqParams> {
  final FaqRepository repository;

  FaqUseCase(this.repository);

  @override
  Future<Either<ErrorModel, List<FaqModel>>> call(FaqParams parameters) async {
    return await repository.getFaq();
  }

  @override
  Future<Either<ErrorModel, List<FaqModel>>> callTest(
      FaqParams parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    List<FaqModel> list = List<FaqModel>.generate(
      10,
      (index) => FaqModel(
        id: index,
        question: 'Question $index',
        answer:
            'Answer $index : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
    );
    return Right(list);
  }
}

class FaqParams {
  toJson() {
    return {};
  }
}

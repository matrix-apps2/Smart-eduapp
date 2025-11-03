import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/contact_us/data/models/contact_us_model.dart';
import '../../../../../modules/contact_us/domain/repositories/contact_us_repository.dart';
import 'package:dartz/dartz.dart';

class ContactUsUseCase extends BaseUseCase<ContactUsModel, ContactUsParams> {
  final ContactUsRepository repository;

  ContactUsUseCase(this.repository);

  @override
  Future<Either<ErrorModel, ContactUsModel>> call(
      ContactUsParams parameters) async {
    return await repository.getContactUs();
  }

  @override
  Future<Either<ErrorModel, ContactUsModel>> callTest(
      ContactUsParams parameters) {
    throw UnimplementedError();
  }
}

class ContactUsParams {
  toJson() {
    return {};
  }
}

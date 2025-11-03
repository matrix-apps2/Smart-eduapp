import '../../../../core/error/error_model.dart';
import '../../../../modules/faq/data/models/faq_model.dart';
import 'package:dartz/dartz.dart';

abstract class FaqRepository {
  Future<Either<ErrorModel, List<FaqModel>>> getFaq();
}

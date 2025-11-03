import '../../../../core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../modules/contact_us/data/models/contact_us_model.dart';

abstract class ContactUsRepository {
  Future<Either<ErrorModel, ContactUsModel>> getContactUs();
}

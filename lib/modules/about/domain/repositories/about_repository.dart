import '../../../../core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../modules/about/data/models/about_model.dart';

abstract class AboutRepository {
  Future<Either<ErrorModel, AboutModel>> getAbout();
}

import '../../../../core/error/error_model.dart';
import '../../../../modules/packages/data/models/packages_model.dart';
import 'package:dartz/dartz.dart';

abstract class PackagesRepository {
  Future<Either<ErrorModel, List<PackagesModel>>> getPackages();
}

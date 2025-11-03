import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/location/data/models/country_model.dart';
import '../../../../modules/location/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class CountriesUseCase extends BaseUseCase<List<CountryModel>, NoParameters> {
  final LocationRepository repository;

  CountriesUseCase(this.repository);

  @override
  Future<Either<ErrorModel, List<CountryModel>>> call(
      NoParameters parameters) async {
    return await repository.getCountries(params: parameters);
  }

  @override
  Future<Either<ErrorModel, List<CountryModel>>> callTest(
      NoParameters parameters) {
    throw UnimplementedError();
  }
}

import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/location/data/models/city_model.dart';
import '../../../../modules/location/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class CitiesUseCase extends BaseUseCase<List<CityModel>, CitiesParams> {
  final LocationRepository repository;

  CitiesUseCase(this.repository);

  @override
  Future<Either<ErrorModel, List<CityModel>>> call(
      CitiesParams parameters) async {
    return await repository.getCities(params: parameters);
  }

  @override
  Future<Either<ErrorModel, List<CityModel>>> callTest(
      CitiesParams parameters) {
    throw UnimplementedError();
  }
}

class CitiesParams {
  final int countryId;

  CitiesParams({required this.countryId});

  Map<String, dynamic> toJson() => {"country_id": countryId};
}

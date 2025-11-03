import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/location/data/models/city_model.dart';
import '../../../../modules/location/data/models/country_model.dart';
import '../../../../modules/location/data/models/region_model.dart';
import '../../../../modules/location/domain/usecases/cities_usecase.dart';
import '../../../../modules/location/domain/usecases/regions_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<ErrorModel, List<CityModel>>> getCities(
      {required CitiesParams params});
  Future<Either<ErrorModel, List<RegionModel>>> getRegions(
      {required RegionsParams params});
  Future<Either<ErrorModel, List<CountryModel>>> getCountries(
      {required NoParameters params});
}

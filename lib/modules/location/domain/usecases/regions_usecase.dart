import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/location/data/models/region_model.dart';
import '../../../../modules/location/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class RegionsUseCase extends BaseUseCase<List<RegionModel>, RegionsParams> {
  final LocationRepository repository;

  RegionsUseCase(this.repository);

  @override
  Future<Either<ErrorModel, List<RegionModel>>> call(
      RegionsParams parameters) async {
    return await repository.getRegions(params: parameters);
  }

  @override
  Future<Either<ErrorModel, List<RegionModel>>> callTest(
      RegionsParams parameters) {
    throw UnimplementedError();
  }
}

class RegionsParams {
  final int cityId;

  RegionsParams({required this.cityId});

  Map<String, dynamic> toJson() => {"city_id": cityId};
}

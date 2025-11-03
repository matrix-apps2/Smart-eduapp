import 'dart:async';

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/base/base_usecase.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/location/data/models/city_model.dart';
import '../../../../modules/location/data/models/country_model.dart';
import '../../../../modules/location/data/models/region_model.dart';
import '../../../../modules/location/domain/usecases/cities_usecase.dart';
import '../../../../modules/location/domain/usecases/regions_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/location/domain/repositories/location_repository.dart';

class LocationRepositoryImp implements LocationRepository {
  final NetworkClient networkClient;
  LocationRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, List<CountryModel>>> getCountries(
      {required NoParameters params}) async {
    String url = EndPoints.countries;
    NetworkCallType type = NetworkCallType.get;
    Map<String, dynamic> data = {};
    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);
        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }
        List<CountryModel> data = baseResponse.data
            .map<CountryModel>((e) => CountryModel.fromJson(e))
            .toList();
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, List<CityModel>>> getCities(
      {required CitiesParams params}) {
    // TODO: implement getCities
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, List<RegionModel>>> getRegions(
      {required RegionsParams params}) {
    // TODO: implement getRegions
    throw UnimplementedError();
  }
}

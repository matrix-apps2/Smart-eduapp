import 'dart:async';

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/packages/data/models/packages_model.dart';
import '../../../../modules/packages/domain/repositories/packages_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PackagesRepositoryImp implements PackagesRepository {
  final NetworkClient networkClient;
  PackagesRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, List<PackagesModel>>> getPackages() async {
    String url = EndPoints.profile;
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = {};
    Either<ErrorModel, Response> result =
        await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        BaseResponse baseResponse = BaseResponse.fromJson(r.data);

        if (!baseResponse.success) {
          return Left(ReadableFailure(message: baseResponse.message));
        }

        List<PackagesModel> data = List<PackagesModel>.from(
            baseResponse.data.map((e) => PackagesModel.fromJson(e)));
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

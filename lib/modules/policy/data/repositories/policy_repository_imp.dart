import 'dart:async';

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/policy/data/models/policy_model.dart';
import '../../../../modules/policy/domain/repositories/policy_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PolicyRepositoryImp implements PolicyRepository {
  final NetworkClient networkClient;
  PolicyRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, PolicyModel>> getPolicy() async {
    String url = EndPoints.termsAndConditions;
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

        PolicyModel data = PolicyModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

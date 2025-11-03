import 'dart:async';

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/faq/data/models/faq_model.dart';
import '../../../../modules/faq/domain/repositories/faq_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FaqRepositoryImp implements FaqRepository {
  final NetworkClient networkClient;
  FaqRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, List<FaqModel>>> getFaq() async {
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
        List<FaqModel> data = baseResponse.data
            .map<FaqModel>((e) => FaqModel.fromJson(e))
            .toList();
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

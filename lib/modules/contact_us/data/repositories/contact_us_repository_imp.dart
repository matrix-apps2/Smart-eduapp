import 'dart:async';

import '../../../../core/base/base_network_call.dart';
import '../../../../core/base/base_response.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network/end_points.dart';
import '../../../../modules/contact_us/data/models/contact_us_model.dart';
import '../../../../modules/contact_us/domain/repositories/contact_us_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ContactUsRepositoryImp implements ContactUsRepository {
  final NetworkClient networkClient;
  ContactUsRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, ContactUsModel>> getContactUs() async {
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

        ContactUsModel data = ContactUsModel.fromJson(baseResponse.data);
        return Right(data);
      } catch (e) {
        return Left(JsonFailure(message: e.toString()));
      }
    });
  }
}

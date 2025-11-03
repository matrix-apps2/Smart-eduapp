import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../modules/auth/domain/usecases/verify_account/send_otp_usecase.dart';
import '../../../../modules/auth/domain/usecases/verify_account/verify_account_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  final VerifyAccountUseCase verifyAccountUseCase;
  final SendOtpUseCase sendOtpUseCase;
  VerifyAccountCubit(
    this.verifyAccountUseCase,
    this.sendOtpUseCase,
  ) : super(const VerifyAccountState());

  Future<Either<ErrorModel, UserModel>> verifyAccount(String otp) async {
    emit(state.copyWith(state: BaseState.loading, error: null));
    final result = await verifyAccountUseCase(VerifyAccountParams(otp: otp));

    result.fold(
      (error) => emit(state.copyWith(state: BaseState.error, error: error)),
      (data) => emit(state.copyWith(state: BaseState.loaded, data: data)),
    );

    return result;
  }

  Future<bool> sendOtp(
      {required String phone, required String phoneCountryId}) async {
    emit(state.copyWith(state: BaseState.loading, error: null));
    final result = await sendOtpUseCase(SendOtpParams(
      phone: phone,
      phoneCountryId: phoneCountryId,
    ));
    emit(state.copyWith(state: BaseState.initial, error: null));

    return result.fold(
      (error) => false,
      (data) => true,
    );
  }
}

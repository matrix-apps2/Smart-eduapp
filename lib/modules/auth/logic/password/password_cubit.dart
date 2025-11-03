import '../../../../core/base/base_response.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../modules/auth/domain/usecases/password/change_password_usecase.dart';
import '../../../../modules/auth/domain/usecases/password/forget_password_usecas.dart';
import '../../../../modules/auth/domain/usecases/password/reset_password_usecase.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordCubit;
  PasswordCubit(
    this.changePasswordUseCase,
    this.forgetPasswordUseCase,
    this.resetPasswordCubit,
  ) : super(const PasswordState());

  void changePassword({
    required BuildContext context,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword.isEmpty) {
      AppSnackbar.show(
          context: context, message: Strings().pleaseEnterNewPassword);
      return;
    }
    if (confirmPassword.isEmpty) {
      AppSnackbar.show(
          context: context, message: Strings().pleaseEnterConfirmNewPassword);
      return;
    }
    if (newPassword != confirmPassword) {
      AppSnackbar.show(context: context, message: Strings().passwordNotMatch);
      return;
    }
    //Check RegEX
    // Regex must container 1 uppercase, 1 lowercase, 1 number, 1 special character, 8 characters
    //^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&=*-,()_/{}"]).{8,}$
    if (!RegExp(
            r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&=*-,()_/{}]).{8,}$")
        .hasMatch(newPassword)) {
      AppSnackbar.show(
          context: context, message: Strings().passwordValidationError);
      return;
    }

    emit(state.copyWith(changePasswordState: BaseState.loading));
    Either<ErrorModel, BaseResponse> status =
        await changePasswordUseCase(password: newPassword);

    status.fold((l) {
      emit(state.copyWith(
        changePasswordState: BaseState.error,
        changePasswordError: l,
      ));
    }, (r) {
      emit(state.copyWith(changePasswordState: BaseState.loaded));
      AppNavigation.goBack();
      AppSnackbar.show(context: context, message: r.message);
    });
  }

  void forgetPassword({
    required String phoneOrEmail,
    required String countryId,
    required bool isPhone,
  }) async {
    emit(state.copyWith(forgetPasswordState: BaseState.loading));
    Either<ErrorModel, UserModel> status =
        await forgetPasswordUseCase(ForgetPasswordParams(
      countryId: countryId,
      email: phoneOrEmail,
      type: isPhone ? 'phone' : 'email',
      phone: phoneOrEmail,
    ));

    status.fold((l) {
      emit(state.copyWith(
          forgetPasswordState: BaseState.error, forgetPasswordError: l));
      if (l is ReadableFailure) {
        AppSnackbar.show(
            context: AppNavigation.navigationKey.currentContext!,
            message: l.message);
      }
    }, (r) {
      emit(state.copyWith(forgetPasswordState: BaseState.loaded));
      String phoneCountryId = '${r.countryModel?.id ?? "0"}';
      AppNavigation.toNamed(Routes.otp, arguments: {
        "phone": phoneOrEmail,
        "phoneCountryId": phoneCountryId.isEmpty ? "0" : phoneCountryId,
        "sendOtp": "false",
        "otp": r.passwordOtp ?? r.otp,
        "isForgetPassword": "true",
      });
    });
  }

  Future<Either<ErrorModel, UserModel>> verifyResetPassword(String otp) async {
    emit(state.copyWith(resetPasswordState: BaseState.loading));
    Either<ErrorModel, UserModel> status =
        await resetPasswordCubit(ResetPasswordParams(otp: otp));

    status.fold(
      (error) => emit(
          state.copyWith(resetPasswordState: BaseState.error, error: error)),
      (data) => emit(
          state.copyWith(resetPasswordState: BaseState.loaded, data: data)),
    );
    return status;
  }
}

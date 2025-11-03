import '../../../../app.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../modules/auth/domain/usecases/login_usecase.dart';
import '../../../../utils/debug/echo.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(const LoginState());

  void login(
      {required BuildContext context, required LoginParams params}) async {
    emit(state.copyWith(state: BaseState.loading));

    Either<ErrorModel, UserModel> response = await loginUseCase(params);
    response.fold((l) {
      if (l is ReadableFailure) {
        if (l.message.toLowerCase().contains("verify") ||
            l.message.contains("تأكيد")) {
          AppNavigation.toNamed(Routes.otp, arguments: {
            "phone": params.phone,
            "phoneCountryId": params.phoneCountryId,
            "sendOtp": "true",
          });
        } else {
          emit(state.copyWith(state: BaseState.error, error: l));
        }
      }
    }, (r) {
      if (r.token.isNotEmpty) {
        kEcho("token: ${r.token}");
        AppPrefs prefs = getIt<AppPrefs>();
        prefs.set(AppPrefsKeys.token, r.token);
        prefs.set(AppPrefsKeys.kuserId, r.id);
        Dio dio = getIt<Dio>();
        dio.options.headers["Authorization"] = "Bearer ${r.token}";
        globalUser = r;
        AppNavigation.toNamedOffAll(Routes.layout);
      } else {
        AppNavigation.toNamed(Routes.otp, arguments: {
          "phone": params.phone,
          "phoneCountryId": params.phoneCountryId,
          "sendOtp": "false",
          "otp": r.otp,
        });
      }
    });
    emit(state.copyWith(state: BaseState.initial));
  }

  bool doseEmailIsValid(String email) {
    if (email.isEmpty) {
      return false;
    }
    if (!email.contains("@")) {
      return false;
    }
    if (!email.contains(".")) {
      return false;
    }
    return true;
  }

  void reset() {
    emit(state.copyWith(state: BaseState.initial));
  }
}

import '../../../../app.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../modules/auth/domain/usecases/register/register_usecase.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(
    this.registerUseCase,
  ) : super(const RegisterState());

  Future<void> register(RegisterParams params) async {
    emit(state.copyWith(state: BaseState.loading, error: null));
    final result = await registerUseCase(params);

    result.fold(
      (error) => emit(state.copyWith(state: BaseState.error, error: error)),
      (r) {
        emit(state.copyWith(state: BaseState.loaded, data: r));
        if (r.token.isNotEmpty) {
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
      },
    );
  }
}

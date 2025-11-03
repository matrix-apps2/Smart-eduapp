import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../utils/debug/echo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void onSplashFinished() async {
    AppPrefs prefs = getIt<AppPrefs>();
    String token =
        await prefs.get(AppPrefsKeys.token, defaultValue: '') ?? false;
    kEcho("token $token");
    // if (token.isNotEmpty) {
    //   bool shouldChangePassowrd = prefs.get(AppPrefsKeys.shouldChangePassowrd, defaultValue: false) ?? false;
    //   if (shouldChangePassowrd)
    //     AppNavigation.toNamedOffAll(Routes.changePassword);
    //   else
    //     AppNavigation.toNamedOffAll(Routes.layout);
    // } else
    //   AppNavigation.toNamedOffAll(Routes.loginScreen);
  }
}

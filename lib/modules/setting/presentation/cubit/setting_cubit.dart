import '../../../../core/base/base_states.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../modules/layout/domain/usecases/settings_usecase.dart';
import '../../../../modules/setting/data/models/setting_model.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingsUseCase settingsUseCase;

  SettingCubit(this.settingsUseCase)
      : super(const SettingState(
          state: BaseState.initial,
        ));

  void getCurrentTheme() {
    bool isDarkMode =
        AppPrefs().get(AppPrefsKeys.darkMode, defaultValue: false);
    SettingModel settingModel =
        SettingModel(themeData: isDarkMode ? darkTheme : lightTheme);
    emit(state.copyWith(state: BaseState.loaded, settingModel: settingModel));
  }

  void changeTheme() {
    bool isDarkMode =
        AppPrefs().get(AppPrefsKeys.darkMode, defaultValue: false);
    ThemeData themeData = isDarkMode ? lightTheme : darkTheme;
    emit(state.copyWith(
      state: BaseState.loaded,
      settingModel: state.settingModel!.copyWith(themeData: themeData),
    ));

    AppPrefs().set(AppPrefsKeys.darkMode, themeData == darkTheme);
  }

  void changeLang() {
    String langCode = AppPrefs().get(AppPrefsKeys.locale, defaultValue: 'ar');
    Locale currentLocale = Locale(langCode);
    Locale newLocale = currentLocale == const Locale('ar')
        ? const Locale('en')
        : const Locale('ar');
    // emit(state.copyWith(
    //   state: BaseState.loaded,
    //   settingModel: state.settingModel!.copyWith(locale: newLocale),
    // ));

    // EasyLocalization.of(AppNavigation.navigationKey.currentContext!)?.setLocale(newLocale);
    AppNavigation.navigationKey.currentContext!.setLocale(newLocale);
  }
}

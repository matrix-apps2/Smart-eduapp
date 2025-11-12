import 'dart:async';

import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../core/base/base_states.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import 'modules/setting/presentation/cubit/setting_cubit.dart';
import 'utils/constants/const.dart';
import 'utils/debug/echo.dart';
import 'utils/theme/app_colors.dart';
import 'utils/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'app.dart';
import 'bloc.dart';
import '../../../../core/services/services_locator.dart';

// import 'injection.dart' as injection;

// @pragma('vm:entry-point')
// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   String taskId = task.taskId;
//   bool isTimeout = task.timeout;
//   if (isTimeout) {
//     // This task has exceeded its allowed running-time.
//     // You must stop what you're doing and immediately .finish(taskId)
//     print("[BackgroundFetch] Headless task timed-out: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }
//   print('[BackgroundFetch] Headless event received.');
//   // Do your work here...
//   BackgroundFetch.finish(taskId);
// }
/// 12-nov-25
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // print('${record.level.name}: ${record.time}: ${record.message}');
  });
  // for the responsive service to work (I don't know the reason until now)
  await Future.delayed(const Duration(milliseconds: 300));
  await EasyLocalization.ensureInitialized();

  await initInject();
  // await injection.init();

  //status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppCustomColors.appPrimaryColor,
    statusBarIconBrightness: Brightness.light,
  ));

  String langCode = AppPrefs().get(AppPrefsKeys.locale, defaultValue: 'en');
  Locale locale = Locale(langCode);
  kEcho("start locale ${locale.languageCode}");
  runApp(
    GenerateMultiBloc(
      child: EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translation',
        fallbackLocale: locale,
        saveLocale: true,
        useOnlyLangCode: true,
        startLocale: supportedLocales[1],
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            if (state.state == BaseState.loaded) {
              return MyApp(themeData: lightTheme);
            }
            return Container();
          },
        ),
      ),
    ),
  );
}

final supportedLocales = <Locale>[
  const Locale('ar'),
  const Locale('en'),
];

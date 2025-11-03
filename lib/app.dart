import 'package:country_code_picker/country_code_picker.dart';

import '../../../../core/model/user.dart';
import 'utils/screen_utils.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/routes/app_pages.dart';
import 'utils/routes/app_routes.dart';
import 'utils/routes/navigation_services.dart';

UserModel? globalUser;

class MyApp extends StatelessWidget {
  final ThemeData? themeData;
  const MyApp({required this.themeData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        color: Theme.of(context).scaffoldBackgroundColor,
        // localizationsDelegates: [
        //   CountryLocalizations.delegate,
        //   ...context.localizationDelegates,
        // ],
        localizationsDelegates: [
          CountryLocalizations.delegate,
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
        ],
        // localizationsDelegates: context.localizationDelegates,

        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // locale: supportedLocales[0],

        title: 'Pinnacle',
        // theme: appTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigation.navigationKey,
        initialRoute: Routes.init,
        onGenerateRoute: AppPages.generateRoute,
        builder: (context, child) {
          TransitionBuilder builder = EasyLoading.init();
          ScreenUtils.init(context);

          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            child: child,
            builder: (BuildContext context, Widget? child) {
              return Directionality(
                textDirection: context.locale.languageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: builder(context, child ?? Container()),
              );
            },
          );
        });
  }
}

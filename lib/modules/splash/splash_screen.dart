import 'dart:io';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/animation/image_fadein.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../generated/assets.dart';
import '../../../../modules/location/logic/location_country/country_cubit.dart';
import '../../../../modules/profile/logic/profile_cubit.dart';
import '../../../../utils/constants/const.dart';
import '../../../../utils/extensions/widget_extenstions.dart';
import '../../../../utils/resources/values_manager.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/screen_utils.dart';
import '../../../../utils/styles/decoration.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/theme/appImages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showNoInternet = false;

  @override
  void initState() {
    super.initState();
    // init();
  }

  // init() async {
  //   await context.read<CountryCubit>().getCountries();
  //   await context.read<ProfileCubit>().getProfile();
  //   String? langCode = getIt<AppPrefs>().get(AppPrefsKeys.langCode);
  //   await AppNavigation.toNamed(Routes.getLocationFromMap,
  //           arguments: {"lat": null, "lng": null})
  //       .then((value) => AppNavigation.toNamedOffAll(Routes.loginScreen));
  //
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // const Spacer(),
              Center(
                child: AnimatedImage(
                  width: ScreenUtils.screenWidth / 2,
                  height: ScreenUtils.screenWidth / 2,
                  image: AppImagePath.logo,
                  onFinished: () {
                    AppNavigation.toNamedOffAll(Routes.onboardingScreen);
                  },
                ),
              ),
              // const Spacer(),
              // const CustomLoadingSpinner(
              //   color: Colors.white,
              // ),
              // const SizedBox(height: 20),
              // AppText(
              //   "Version ${Platform.isAndroid ? Const.androidVersion : Const.iosVersion}",
              //   color: Colors.white,
              // ).footerExtra(),
              // const SizedBox(height: 40),
            ],
          ),
          if (showNoInternet)
            Positioned(
              bottom: 56,
              left: 0,
              right: 0,
              child: Container(
                width: deviceWidth,
                color: Colors.white,
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                        child: AppText(Strings().noInternetConnection,
                            align: TextAlign.start)),
                    AppButton(
                      onTap: () {
                        showNoInternet = false;
                        setState(() {});
                      },
                      width: 120,
                      child:
                          AppText(Strings().retry, size: 14).white().fitted(),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

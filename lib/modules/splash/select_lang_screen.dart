import '../../../awesome_extension_package/awesome_extensions.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/animation/image_fadein.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../generated/assets.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/screen_utils.dart';
import '../../../../utils/styles/decoration.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../../utils/translations/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  bool selectedLangIsAr = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: const BoxDecoration().backgroundImage(
                image: Assets.assetsImagesBackground, fit: BoxFit.fill),
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  AnimatedImage(
                    width: ScreenUtils.screenWidth / 2,
                    height: ScreenUtils.screenWidth / 2,
                    image: Assets.assetsImagesLogoNoBk,
                    onFinished: () {},
                  ),
                  Container(
                    decoration: const BoxDecoration()
                        .customColor(AppColor.cardColor.lightColor)
                        .radius(24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Column(
                      children: [
                        AppText(Strings().selectYourLanguage, size: 20).bold(),
                        const SizedBox(height: 24),
                        AppButton(
                          onTap: () => _onSelectLang('ar'),
                          color: Colors.white,
                          textColor: Colors.black87,
                          fontSize: 20,
                          title: "العربية",
                          leadingWidget: Image.asset(
                            Assets.assetsImagesIcLangAr,
                            width: 32.h,
                            height: 32.h,
                          ).paddingSymmetric(horizontal: 12, vertical: 4),
                        ),
                        const SizedBox(height: 18),
                        AppButton(
                          onTap: () => _onSelectLang('en'),
                          color: Colors.white,
                          fontSize: 20,
                          textColor: Colors.black87,
                          title: "English",
                          leadingWidget: Image.asset(
                            Assets.assetsImagesIcLangEn,
                            width: 32.h,
                            height: 32.h,
                          ).paddingSymmetric(horizontal: 12, vertical: 4),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSelectLang(String s) {
    AppNavigation.navigationKey.currentContext!.setLocale(Locale(s));
    getIt<AppPrefs>().set(AppPrefsKeys.langCode, s);
    String? token = getIt<AppPrefs>().get(AppPrefsKeys.token);
    AppNavigation.toNamed(Routes.layout);
  }
}

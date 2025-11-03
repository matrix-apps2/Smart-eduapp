import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/dialog/base/simple_dialogs.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/styles/decoration.dart';
import '../../../../utils/translations/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/theme/appColors.dart';
import '../../utils/theme/appImages.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = context.locale.languageCode;
    List<MoreItemModel> list = [];
    list.add(MoreItemModel(
        title: "المنتجات المفضلة",
        image: AppImagePath.heart,
        onTap: () {}));
    list.add(MoreItemModel(
        title: "معلومات الحساب",
        image: AppImagePath.accountInfo,
        onTap: () {
          AppNavigation.toNamed(Routes.profileScreen);
        }));
    list.add(MoreItemModel(
        title: "الاعدادت",
        image: AppImagePath.settings,
        onTap: () => AppNavigation.toNamed(Routes.about)));
    list.add(MoreItemModel(
        title: "عن بينكل",
        image: AppImagePath.info,
        // additionalInfo: currentLang == 'ar' ? '(العربية)' : '(English)',
        onTap: () {

        }));
    list.add(MoreItemModel(
        title: "تقيم التطبيق",
        image: AppImagePath.rateApp,
        onTap: () {

        }));
    list.add(MoreItemModel(
        title: "تسجيل الخروج",
        image: AppImagePath.logout,
        // icon: FontAwesomeIcons.bookAtlas,
        onTap: () => _logout(context)));

    // list.add(
    //   MoreItemModel(
    //       title: Strings().logout,
    //       onTap: () => _logout(context),
    //       icon: FontAwesomeIcons.rightFromBracket),
    // );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 60.h),

            AppText("الملف الشخصى" , size: 25.sp,).bold().toCenter(),
        24.heightBox,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText("مرحبا , أحمد عمر" , size: 20.sp,).bold(),
              AppText("ahmed.omer@gmail.com" , color: AppCustomColors.colorGrey75,).mediumBold(),
            ],
          ),
        ).paddingSymmetric(horizontal: 16.w),
            28.heightBox,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
child: Column(
  children: [
    ...list.map((e) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          onTap: e.onTap as void Function()?,
          leading: e.image != null
              ? Image.asset(e.image! , width: 20,height: 20,)
              : Container(
            decoration: const BoxDecoration()
                .customColor(const Color(0xffFAFAFC))
                .radius(10),
            padding: const EdgeInsets.all(12),
            child: Icon(e.icon,
                color: e.title != Strings().logout
                    ? null
                    : Colors.red),
          ),
          title: Row(
            children: [
              Expanded(child: AppText(e.title).start().mediumBold()),
              if (e.additionalInfo != null)
                AppText(e.additionalInfo!).footer(),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward ,color: AppCustomColors.colorGrey75,),
        ),
      );
    }).toList(),
  ],
),
            ).paddingSymmetric(horizontal: 16.w),

          ],
        ),
      ),
    ) ;
  }

  changeLanguage(BuildContext context) {
    String currentLang = context.locale.languageCode;
    {
      SimpleDialogs.showQuestionDialog(
        context: context,
        title: Strings().changeLanguage,
        description: Strings().changeLanguageDescription,
        onYes: () {
          getIt<AppPrefs>()
              .set(AppPrefsKeys.langCode, currentLang == 'ar' ? 'en' : 'ar');
          if (currentLang == 'ar') {
            context.setLocale(const Locale('en'));
          } else {
            context.setLocale(const Locale('ar'));
          }
        },
        onNo: () {},
      );
    }
  }

  _logout(BuildContext context) {
    SimpleDialogs.showQuestionDialog(
      context: context,
      title: Strings().logout,
      description: Strings().logoutMessageConfirm,
      onYes: () {
        getIt<AppPrefs>().logout();
        AppNavigation.toNamedOffAll(Routes.splahScreen);
      },
      onNo: () {},
    );
  }
}

class MoreItemModel {
  String title;
  String? image;
  IconData? icon;
  String? additionalInfo;
  Function onTap;

  MoreItemModel({
    required this.title,
    this.image,
    this.icon,
    this.additionalInfo,
    required this.onTap,
  });
}

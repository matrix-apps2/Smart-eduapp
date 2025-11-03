import '../../utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme appBarThemeLight = AppBarTheme(
  color: Colors.white,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColor.statusBarColor.lightColor,
    systemNavigationBarColor: AppColor.appBarColor.lightColor,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ),
  elevation: 0,
  shadowColor: Colors.transparent,
  foregroundColor: AppColor.appBarColor.lightColor,
  surfaceTintColor: AppColor.appBarColor.lightColor,
  toolbarTextStyle: TextStyle(
    color: AppColor.appBarIconsColor.lightColor,
  ),
  iconTheme: IconThemeData(
    color: AppColor.appBarIconsColor.lightColor,
  ),
);
AppBarTheme appBarThemeDark = AppBarTheme(
  color: Colors.transparent,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColor.statusBarColor.darkColor,
    systemNavigationBarColor: AppColor.appBarColor.darkColor,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ),
  toolbarTextStyle: TextStyle(color: AppColor.appBarIconsColor.darkColor),
  iconTheme: IconThemeData(
    color: AppColor.appBarIconsColor.darkColor,
  ),
);

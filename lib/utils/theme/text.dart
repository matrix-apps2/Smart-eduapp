import '../../utils/resources/font_manager.dart';
import '../../utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// The `displayColor` is applied to [headline4], [headline3], [headline2],
/// [headline1], and [caption]. The `bodyColor` is applied to the remaining
/// text styles.

// light
TextTheme textThemeLight = ThemeData.light()
    .textTheme
    .copyWith(
      bodySmall: TextStyle(color: AppColor.textGrey.lightColor),
    )
    .apply(
      bodyColor: AppColor.textSecondaryDark.lightColor,
      displayColor: AppColor.textPrimary.lightColor,
      fontFamily: FontConstants.fontFamily,
    );
// dark
TextTheme textThemeDark = ThemeData.dark()
    .textTheme
    .copyWith(
      bodySmall: TextStyle(color: AppColor.textGrey.lightColor),
    )
    .apply(
      bodyColor: AppColor.textSecondaryDark.darkColor,
      displayColor: AppColor.textPrimary.darkColor,
      fontFamily: FontConstants.fontFamily,
    );

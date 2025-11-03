import '../../core/services/services_locator.dart';
import '../../core/storge/shared_pref/cache_consumer.dart';
import '../../core/storge/shared_pref/storage_keys.dart';
import 'package:flutter/material.dart';

class AppColor {
  static Clr primaryColor =
      ColorModel(const Color(0xFF0295DD), const Color(0xFF0295DD));
  static Clr primaryColorDark =
      ColorModel(const Color(0xFF066D64), const Color(0xFF066D64));
  static Clr primaryColorLight =
      ColorModel(const Color(0xFF3E9BD2), const Color(0xFF3E9BD2));
  static Clr accentColor =
      ColorModel(const Color(0xFF333333), const Color(0xFF333333));
  static Clr accentColorDark =
      ColorModel(const Color(0xFF151515), const Color(0xFF151515));
  static Clr accentColorLight =
      ColorModel(const Color(0xFF4A4A4A), const Color(0xFF4A4A4A));
  static Clr statusBarColor =
      ColorModel(const Color(0xff0295DD), const Color(0xff0295DD));
  static Clr sliderColor =
      ColorModel(const Color(0xff212121), const Color(0xff212121));
  static Clr bottomNavigationBarColor =
      ColorModel(Colors.white, const Color(0xff202429));
  static Clr scaffoldBackgroundColor =
      ColorModel(Colors.white, const Color(0xff1A1C1E));
  static Clr cardColor =
      ColorModel(const Color(0xffF5F7FF), const Color(0xFF313131));
  static Clr surfaceTintColor =
      ColorModel(const Color(0xffFAFAFD), const Color(0xFF313131));
  static Clr appBarColor =
      ColorModel(const Color(0xffFDFCFF), const Color(0xff1A1C1E));
  static Clr iconsColor =
      ColorModel(const Color(0xff43474E), const Color(0xffC3C7CF));
  static Clr iconsColorDark =
      ColorModel(const Color(0xff43474E), const Color(0xffC3C7CF));
  static Clr errorColor =
      ColorModel(const Color(0xffBA1A1A), const Color(0xffFFB4AB));
  static Clr errorColorDark =
      ColorModel(const Color(0xffBA1A1A), const Color(0xffFFB4AB));
  static Clr appBarIconsColor =
      ColorModel(const Color(0xff43474E), const Color(0xffC3C7CF));
  static Clr appBarIconsColorDark =
      ColorModel(const Color(0xff43474E), const Color(0xffC3C7CF));
  static Clr appBarTextColor =
      ColorModel(const Color(0xff43474E), const Color(0xffC3C7CF));
  static Clr appBarTextColorDark =
      ColorModel(const Color(0xff43474E), const Color(0xffC3C7CF));
  static Clr textPrimary =
      ColorModel(const Color(0xff43474E), const Color(0xffE2E2E6));
  static Clr textPrimaryDark =
      ColorModel(const Color(0xff43474E), const Color(0xffE2E2E6));
  static Clr textSecondaryDark =
      ColorModel(const Color(0xff43474E), const Color(0xffE2E2E6));
  static Clr textBlack = ColorModel(Colors.black, Colors.white);
  static Clr textGrey = ColorModel(Colors.grey, Colors.white);
  static Clr colorButton =
      ColorModel(const Color(0xffE67E23), const Color(0xff9ECBFF));
  static Clr colorButtonDark =
      ColorModel(const Color(0xffE67E23), const Color(0xff9ECBFF));
  static Clr green =
      ColorModel(const Color.fromARGB(255, 1, 71, 0), const Color(0xff9ECBFF));
  static Clr red =
      ColorModel(const Color.fromARGB(255, 108, 1, 1), const Color(0xff9ECBFF));

  static Color clr(Clr color) {
    AppPrefs prefs = getIt<AppPrefs>();
    if (prefs.get(AppPrefsKeys.darkMode, defaultValue: false)) {
      return color.darkColor;
    } else {
      return color.lightColor;
    }
  }
}

typedef Clr = ColorModel;

class ColorModel {
  Color lightColor;
  Color darkColor;

  ColorModel(this.lightColor, this.darkColor);
}

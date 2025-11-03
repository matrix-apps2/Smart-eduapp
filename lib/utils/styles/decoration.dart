import '../../utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../resources/values_manager.dart';

extension CustomDecoration on BoxDecoration {
  BoxDecoration radius(double? radius) => (this).copyWith(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? kRadius)));
  BoxDecoration customRadius({required BorderRadius borderRadius}) =>
      (this).copyWith(borderRadius: borderRadius);
  BoxDecoration radiusTop({double radius = kRadius}) => (this).copyWith(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
  BoxDecoration shadow() => (this).copyWith(boxShadow: [
        BoxShadow(color: Colors.grey[300]!, spreadRadius: 1, blurRadius: 5)
      ]);
  BoxDecoration listStyle({double radius = kRadius}) => (this).copyWith(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(radius)));
  BoxDecoration borderStyle({double width = 1, Color color = Colors.white}) =>
      (this).copyWith(border: Border.all(width: width, color: color));
  BoxDecoration customColor(Color color) => (this).copyWith(color: color);
  BoxDecoration backgroundImage({String? image, BoxFit? fit}) =>
      (this).copyWith(
          image: image != null
              ? DecorationImage(
                  image: AssetImage(image), fit: fit ?? BoxFit.cover)
              : null);

  BoxDecoration card(BuildContext context) => (this).copyWith(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(kRadius)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardTheme.shadowColor ?? Colors.grey[300]!,
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
      );
  BoxDecoration badge({Color? color}) => (this).copyWith(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(kRadius)),
        boxShadow: [
          BoxShadow(color: Colors.grey[200]!, spreadRadius: 1, blurRadius: 5)
        ],
      );

  BoxDecoration chip({Color? color, double radius = 6}) => (this).copyWith(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      );
}

TextStyle appBarTextStyle = const TextStyle(fontSize: 16, height: 1);

final InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColor.cardColor.lightColor,
  hintStyle: TextStyle(color: AppColor.textGrey.lightColor),
  labelStyle: TextStyle(color: AppColor.textPrimary.lightColor),
  suffixStyle: TextStyle(color: AppColor.textPrimary.lightColor),
  errorStyle: TextStyle(color: AppColor.errorColor.lightColor),
  prefixIconColor: AppColor.primaryColorDark.lightColor,
  iconColor: AppColor.primaryColorDark.lightColor,
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kRadius),
    borderSide: BorderSide(
        color: AppColor.scaffoldBackgroundColor.lightColor, width: 1),
  ),
  contentPadding: EdgeInsets.all(12.w),
  errorMaxLines: 2,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffE5E7EB)),
    borderRadius: BorderRadius.circular(kRadius),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffE5E7EB)),
    borderRadius: BorderRadius.circular(kRadius),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.errorColor.lightColor),
    borderRadius: BorderRadius.circular(kRadius),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.primaryColor.lightColor),
    borderRadius: BorderRadius.circular(kRadius),
  ),
);

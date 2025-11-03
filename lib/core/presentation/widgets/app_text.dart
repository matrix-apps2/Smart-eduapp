import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../utils/translations/strings.dart';

class AppText extends StatelessWidget {
  final String? message;
  final String? fontFamily;
  final double size;
  final TextAlign align;
  final double pv;
  final double ph;
  final double? height;
  final double? wordSpacing;
  final FontWeight fontWeight;
  final int? maxLines;
  final Color? color;
  final TextStyle? style;
  const AppText(
    this.message, {
    Key? key,
    this.height,
    this.fontFamily,
    this.wordSpacing,
    this.size = 14,
    this.align = TextAlign.center,
    this.pv = 4,
    this.ph = 4,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ph, vertical: pv),
      child: Text(
        message ?? (kDebugMode ? 'null' : ''),
        style: style ??
            TextStyle(
              color: color ?? Colors.black,
              fontSize: size,
              fontWeight: fontWeight,
              height: height,
              fontFamily: fontFamily,
              wordSpacing: wordSpacing,
            ),
        textAlign: align,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
      ),
    );
  }

  copyWith({
    String? message,
    String? fontFamily,
    double? size,
    TextAlign? align,
    double? pv,
    double? ph,
    double? height,
    FontWeight? fontWeight,
    int? maxLines,
    Color? color,
    TextStyle? textStyle,
  }) {
    return AppText(
      message ?? this.message,
      fontFamily: fontFamily ?? this.fontFamily,
      size: size ?? this.size,
      align: align ?? this.align,
      pv: pv ?? this.pv,
      ph: ph ?? this.ph,
      height: height ?? this.height,
      fontWeight: fontWeight ?? this.fontWeight,
      maxLines: maxLines ?? this.maxLines,
      color: color ?? this.color,
      style: textStyle ?? style,
    );
  }
}

extension TextCustom on AppText {
  AppText headerExtra() => copyWith(size: size + (4));
  AppText header() => copyWith(size: size + (2));
  AppText footer() => copyWith(size: size - (2));
  AppText mediumBold() => copyWith(size: size, fontWeight: FontWeight.w500);
  AppText bold() => copyWith(size: size, fontWeight: FontWeight.bold);
  AppText toCurrency() => copyWith(message: '$message ${Strings().currency}');
  AppText numberFormatter() {
    String formatted = message?.replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') ??
        "";
    return copyWith(message: formatted);
  }

  AppText footerExtra() => copyWith(size: size - (4));
  AppText primary(BuildContext context) => copyWith(
        color: Theme.of(context).primaryColor,
        textStyle: style?.copyWith(color: Theme.of(context).primaryColorDark),
      );
  AppText underLine(BuildContext context) => copyWith(
      textStyle: style?.copyWith(decoration: TextDecoration.underline) ??
          TextStyle(
              decoration: TextDecoration.underline,
              fontSize: size,
              decorationColor: Theme.of(context).primaryColorDark));
  AppText white() => copyWith(color: Colors.white);
  // AppText applySettings(SettingModel settingModel) => AppText(
  //       message,
  //       size: 14 * ((settingModel.fontSize * 2) / 100),
  //       height: settingModel.lineHeight + 1,
  //       fontFamily: settingModel.fontType,
  //     );

  AppText start() => copyWith(align: TextAlign.start);
  AppText end() => copyWith(align: TextAlign.start);
}

extension TextCustomStyle on TextStyle {
  TextStyle customColor(Color color) => (this).copyWith(color: color);
  TextStyle colorWhite() => (this).copyWith(color: Colors.white);
  TextStyle errorStyle(BuildContext context) =>
      (this).copyWith(color: Theme.of(context).colorScheme.error);
  TextStyle hintStyle(BuildContext context) =>
      (this).copyWith(color: Theme.of(context).colorScheme.secondary);
  TextStyle textFamily({String? fontFamily}) =>
      (this).copyWith(fontFamily: fontFamily);
  TextStyle boldStyle() => (this).copyWith(fontWeight: FontWeight.bold);
  TextStyle boldBlackStyle() =>
      (this).copyWith(fontWeight: FontWeight.bold, color: Colors.black);
  TextStyle boldLiteStyle() => (this).copyWith(fontWeight: FontWeight.w500);
  TextStyle blackStyle() => (this).copyWith(color: Colors.black);
  TextStyle underLineStyle() =>
      (this).copyWith(decoration: TextDecoration.underline);
  TextStyle ellipsisStyle({int line = 1}) =>
      (this).copyWith(overflow: TextOverflow.ellipsis);
  TextStyle heightStyle({double height = 1}) => (this).copyWith(height: height);
  TextStyle semiBoldStyle({double height = 1}) =>
      (this).copyWith(fontWeight: FontWeight.w600);
}

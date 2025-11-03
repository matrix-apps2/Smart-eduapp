import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingModel extends Equatable {
  final String? fontType;
  final double? fontSize;
  final double? lineHeight;
  final double? brightness;
  final bool? receiveNotification;
  final int? fontColor;
  final int? backgroundColor;
  final ThemeData? themeData;
  final String? lang;
  final Locale? locale;
  SettingModel({
    this.fontType,
    this.fontSize,
    this.lineHeight,
    this.brightness,
    this.receiveNotification,
    this.fontColor,
    this.backgroundColor,
    this.themeData,
    this.lang,
    this.locale,
  });

  SettingModel copyWith({
    String? fontType,
    double? fontSize,
    ThemeData? themeData,
    double? lineHeight,
    double? brightness,
    bool? receiveNotification,
    int? fontColor,
    int? backgroundColor,
    Locale? locale,
  }) {
    return SettingModel(
      fontType: fontType ?? this.fontType,
      fontSize: fontSize ?? this.fontSize,
      themeData: themeData ?? this.themeData,
      lineHeight: lineHeight ?? this.lineHeight,
      brightness: brightness ?? this.brightness,
      receiveNotification: receiveNotification ?? this.receiveNotification,
      fontColor: fontColor ?? this.fontColor,
      locale: locale ?? this.locale,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  List<Object?> get props => [
        fontType,
        fontSize,
        themeData,
        lineHeight,
        brightness,
        locale,
        receiveNotification,
        fontColor,
        backgroundColor,
      ];
}

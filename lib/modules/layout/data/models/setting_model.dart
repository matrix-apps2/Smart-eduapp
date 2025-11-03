

import 'package:flutter/foundation.dart';

class SettingModel {
  final bool isForceUpdate;
  final int trackingInterval;
  final int notificationCount;
  final AppVersions? appVersions;

  const SettingModel({
    required this.trackingInterval,
    required this.isForceUpdate,
    required this.notificationCount,
    required this.appVersions,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        trackingInterval: json["trackingInterval"] ?? 0,
        notificationCount: kDebugMode ? 2 : json["notificationCount"] ?? 0,
        appVersions: json["appVersions"] == null ? null : AppVersions.fromJson(json["appVersions"]),
        isForceUpdate: json["isForceUpdate"] ?? false,
      );
}
class AppVersions {
  AppVersions({
    required this.androidVersions,
    required this.iosVersions,
  });

  List<String> androidVersions;
  List<String> iosVersions;

  factory AppVersions.fromJson(Map<String, dynamic> json) => AppVersions(
        androidVersions: json["androidVersions"] == null ? [] : List<String>.from(json["androidVersions"].map((x) => x)),
        iosVersions: json["iosVersions"] == null ? [] : List<String>.from(json["iosVersions"].map((x) => x)),
      );
}

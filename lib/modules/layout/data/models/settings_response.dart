// To parse this JSON data, do
//
//     final settingsResponse = settingsResponseFromJson(jsonString);

import 'dart:convert';

import '../../../../modules/layout/data/models/setting_feature_model.dart';
import '../../../../modules/layout/data/models/setting_model.dart';

SettingsResponse settingsResponseFromJson(String str) =>
    SettingsResponse.fromJson(json.decode(str));

class SettingsResponse {
  SettingsResponse({
    required this.data,
  });

  final Data data;

  factory SettingsResponse.fromJson(Map<String, dynamic> json) =>
      SettingsResponse(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.roles,
    required this.setting,
    required this.features,
  });

  final List<SettingFeatureModel> features;
  final List<Role> roles;
  final SettingModel setting;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        setting: SettingModel.fromJson(json["setting"]),
        features: List<SettingFeatureModel>.from(
            json["features"].map((x) => SettingFeatureModel.fromJson(x))),
      );
}

class Role {
  Role({
    required this.roleId,
    required this.roleName,
    required this.roleFullName,
  });

  final String roleId;
  final String roleName;
  final String roleFullName;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleId"],
        roleName: json["roleName"],
        roleFullName: json["roleFullName"],
      );

  Map<String, dynamic> toJson() => {
        "roleId": roleId,
        "roleName": roleName,
        "roleFullName": roleFullName,
      };
}

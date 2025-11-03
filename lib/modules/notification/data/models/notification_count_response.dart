import 'dart:convert';


// ignore: non_constant_identifier_names
NotificationCountResponse NotificationCountResponseFromJson(String str) => NotificationCountResponse.fromJson(json.decode(str));

class NotificationCountResponse {
  NotificationCountResponse({
    required this.setting,
  });

  final SettingTemp setting;

  factory NotificationCountResponse.fromJson(Map<String, dynamic> json) => NotificationCountResponse(
        setting: SettingTemp.fromJson(json["setting"]),
      );
}

class SettingTemp {
  final int notificationCount;
  const SettingTemp({required this.notificationCount});

  factory SettingTemp.fromJson(Map<String, dynamic> json) => SettingTemp(
        notificationCount: json["notificationCount"] ?? 0,
      );
}

import 'dart:io';

import '../widgets/app_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> getInfoDeviceId(String phone) async {
  String deviceId = '';
  String deviceId2 = '';
  String deviceId3 = '';

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id ?? '';
    deviceId2 = androidInfo.version.codename ?? '';
    deviceId3 = androidInfo.device ?? '';
  } else {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = phone;
    deviceId2 = '${iosInfo.utsname.machine}-${iosInfo.systemName}';
    deviceId3 = iosInfo.identifierForVendor ?? '';
  }
  return '$deviceId-$deviceId2-$deviceId3';
}

Future<String> getInfoModel() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String model = "";

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    model = androidInfo.model ?? '';
  } else {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    model = iosInfo.model ?? iosInfo.name ?? "NA";
  }
  return model;
}

Future<String> getInfoBrand() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String brand = "";

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    brand = androidInfo.brand ?? '';
  } else {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    brand = iosInfo.systemName ?? "NA";
  }
  return brand;
}

Future<void> actionCall(String? customerMobile) async {
  await AppLaunch.launchPhone(phone: customerMobile);
}

Future<void> actionOpenLocation(String? coordination) async {
  if (coordination == null || !coordination.contains(',')) return;

  List<String> list = coordination.split(',');
  if (list.length != 2) return;

  String url = 'https://www.google.com/maps/search/?api=1&query=${list[0]},${list[1]}';
  Uri uri = Uri.parse(url);
  bool canLaunch = await canLaunchUrl(uri);
  if (canLaunch) {
    await launchUrl(uri);
  }
}

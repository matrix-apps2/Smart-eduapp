import 'dart:developer';

import '../../utils/constants/const.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// 💤 📝  🕵  📌
// location icon 📍 map icon 🗺 gps icon 🛰
kEcho(String text) {
  if (Const.kDebug) log('✅ $text', level: 1);
}

kEchoLocation(String text) {
  if (Const.kDebug) log('📍 $text', level: 1);
}

kEcho100(String text) {
  if (Const.kDebug) log('💯 $text', level: 2);
}

kEchoError(String text, {required String name}) {
  if (Const.kDebug) log('❌ $name');
  if (Const.kDebug) log('❌ $text', level: 3);
  if (!kDebugMode) Sentry.captureMessage("$name: $text");
}

kEchoSearch(String text) {
  if (Const.kDebug) print('🔎 $text');
}

kEchoDb(String? text) {
  if (Const.kDebug) print('📝 $text');
}

kLogger(String? text) {
  Logger logger = Logger();
  logger.w("📝 $text");
}

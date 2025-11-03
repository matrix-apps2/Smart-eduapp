import '../../../../core/services/services_locator.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  late FlutterSecureStorage _secureStorage;
  late SharedPreferences _sharedPreferences;

  AppPrefs() {
    _secureStorage = getIt<FlutterSecureStorage>();
    _sharedPreferences = getIt<SharedPreferences>();
  }

  /// shared prefs

  dynamic get(String key, {dynamic defaultValue}) {
    dynamic value = _sharedPreferences.get(key);
    if (value == null) return defaultValue;
    return value;
  }

  Future<bool> set(String key, var value) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    } else {
      return await _sharedPreferences.setStringList(key, value);
    }
  }

  Future<bool> delete(String key) async => await _sharedPreferences.remove(key);
  void logout() async {
    await _sharedPreferences.clear();
    await _secureStorage.deleteAll();
    AppNavigation.toNamedOffAll(Routes.loginScreen);
    // networkLogout();
    // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    // firebaseMessaging.deleteToken();
  }

  /// Secure storage
  Future<String?> getSecuredData(String key) async =>
      await _secureStorage.read(key: key);

  Future<void> saveSecuredData(String key, String value) async =>
      await _secureStorage.write(key: key, value: value);

  Future<void> deleteSecuredData() async => await _secureStorage.deleteAll();
}

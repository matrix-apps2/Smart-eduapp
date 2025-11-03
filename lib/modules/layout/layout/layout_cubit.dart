import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/firebase_methods.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../utils/constants/const.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(const LayoutState());

  void initStates() {
    emit(state.copyWith(
      state: BaseState.initial,
      error: null,
    ));
  }

  /// Get Device Info and store in Firebase
  Future<void> getInfoDeviceId() async {
    AppPrefs prefs = getIt<AppPrefs>();
    bool deviceInfoAlreadySaved =
    prefs.get(AppPrefsKeys.deviceInfoSaved, defaultValue: false);

    if (!deviceInfoAlreadySaved) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      Map<String, String> mapList = {
        'androidId': androidInfo.version.codename ?? '',
        'board': androidInfo.board ?? '',
        'bootloader': androidInfo.bootloader ?? '',
        'brand': androidInfo.brand ?? '',
        'device': androidInfo.device ?? '',
        'display': androidInfo.display ?? '',
        'fingerprint': androidInfo.fingerprint ?? '',
        'hardware': androidInfo.hardware ?? '',
        'host': androidInfo.host ?? '',
        'id': androidInfo.id ?? '',
        'manufacturer': androidInfo.manufacturer ?? '',
        'isPhysicalDevice': "${androidInfo.isPhysicalDevice}",
        'baseOS': androidInfo.version.baseOS ?? '',
        'codename': androidInfo.version.codename ?? '',
        'release': androidInfo.version.release ?? '',
        'sdkInt': "${androidInfo.version.sdkInt}",
        'model': androidInfo.model ?? '',
        'tags': androidInfo.tags ?? '',
      };

      // TODO: handle for Huawei
      if (!Const.platformHuawie) {
        FirebaseMethods().updateSetting(mapList: mapList);
      }

      prefs.set(AppPrefsKeys.deviceInfoSaved, true);
    }
  }

  void setCurrentIndex(int i) {
    emit(state.copyWith(bottomNavIndex: i));
  }
}

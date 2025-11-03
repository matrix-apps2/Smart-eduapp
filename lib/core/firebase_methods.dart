import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../utils/debug/echo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethods {
  Future<void> trackCurrentLocation(
    double latitude,
    double longitude,
    DateTime dateTime,
  ) async {
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    String userId = getIt<AppPrefs>().get(AppPrefsKeys.kuserId) ?? '';
    try {
      await FirebaseFirestore.instance
          .collection('drivers-tracking-location')
          .doc(userId)
          .set({
        'location': GeoPoint(latitude, longitude),
        'userId': userId,
        'userName': "user name",
        'time': timestamp,
      });
    } catch (e) {
      kEchoError("TrackingLocationError $e", name: "trackCurrentLocation");
    }
  }

  Future<void> trackLocationHistory(
    double latitude,
    double longitude,
    DateTime dateTime,
    String provider,
  ) async {
    kEchoError("trackLocationHistory ", name: "trackLocationHistory 1");
    String userId = getIt<AppPrefs>().get(AppPrefsKeys.kuserId) ?? '';
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    try {
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(userId)
          .collection('locations')
          .doc()
          .set(
        {
          'location': GeoPoint(latitude, longitude),
          'time': timestamp,
          'provider': provider,
        },
      );
    } catch (e) {
      kEchoError("trackLocationHistory 1 $e", name: "trackLocationHistory 2");
    }
  }

  Future<List<GeoPoint>> getDriversLocation() async {
    try {
      List<GeoPoint> geoPoints = [];
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc('81ebf18b-f281-4dce-9691-0a9da6d023d1')
          .collection('locations')
          .limit(10)
          .orderBy('time')
          .get()
          .then((value) {
        for (var element in value.docs) {
          GeoPoint geoPoint = element.data()['location'];
          geoPoints.add(geoPoint);
        }
      });
      return geoPoints;
    } catch (e) {
      kEchoError("trackLocationHistory 2 $e", name: "trackLocationHistory 3");
    }
    return [];
  }

  Future<void> updateSetting({
    required Map<String, String> mapList,
  }) async {
    kEcho("updateSetting init");
    Timestamp timestamp = Timestamp.fromDate(DateTime.now());
    try {
      String userId = getIt<AppPrefs>().get(AppPrefsKeys.kuserId) ?? '';
      if (userId.isEmpty) return;
      Map<String, dynamic> map = {};
      map.addAll(mapList);
      map.addAll({'time': timestamp});
      kEcho("updateSetting $map");
      await FirebaseFirestore.instance
          .collection('settings')
          .doc(userId)
          .set(map, SetOptions(merge: true))
          .then((value) {
        AppPrefs prefs = getIt<AppPrefs>();
        prefs.set(AppPrefsKeys.deviceInfoSaved, true);
      });
    } catch (e) {
      kEchoError("trackLocationHistory 3 $e", name: "trackLocationHistory 4");
    }
  }
}

import '../utils/routes/navigation_services.dart';
import '../utils/translations/strings.dart';
import '../widgets/app_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLaunch {
  static Future<void> launchPhone({required String? phone}) async {
    String error = '';
    try {
      if (phone == null) error = "Phone number is null";
      if (phone!.isEmpty) error = "Phone number is empty";
      if (error.isEmpty) {
        Uri uri = Uri(scheme: 'tel', path: phone);
        if (await canLaunchUrl(uri)) {
          await launchUrl('tel:$phone');
        } else {
          throw 'Could not launch $phone';
        }
      }
    } catch (e) {
      error = '$e';
    }
    if (error.isNotEmpty) {
      AppSnackbar.show(
        context: AppNavigation.navigationKey.currentContext!,
        title: Strings().notification,
        message: error,
      );
    }
  }

  static Future<void> launchMap(String lat, String lng) async {
    String error = '';
    try {
      if (lat.isEmpty) error = "Latitude is empty";
      if (lng.isEmpty) error = "Longitude is empty";
      if (error.isEmpty) {
        Uri uri = Uri(
          scheme: 'geo',
          path: '$lat,$lng',
        );
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri.toString());
        } else {
          throw 'Could not launch $lat,$lng';
        }
      }
    } catch (e) {
      error = '$e';
    }
    if (error.isNotEmpty) {
      AppSnackbar.show(
        context: AppNavigation.navigationKey.currentContext!,
        title: Strings().notification,
        message: error,
      );
    }
  }

  static Future<void> launchUrl(String? url) async {
    String error = '';
    try {
      if (url == null) error = "Url is null";
      if (url!.isEmpty) error = "Url is empty";
      if (error.isEmpty) {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    } catch (e) {
      error = '$e';
    }
    if (error.isNotEmpty) {
      AppSnackbar.show(
        context: AppNavigation.navigationKey.currentContext!,
        title: Strings().notification,
        message: error,
      );
    }
  }
}

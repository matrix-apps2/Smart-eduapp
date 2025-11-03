import '../core/presentation/widgets/app_text.dart';
import '../utils/translations/strings.dart';
import '../widgets/animated_linear_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning, info, other }

class AppSnackbar {
  static void show({
    required BuildContext context,
    String? title,
    required String message,
    SnackbarType type = SnackbarType.other,
  }) {
    IconData iconData = Icons.info_outline;
    switch (type) {
      case SnackbarType.success:
        iconData = Icons.check_circle_outline;
        break;
      case SnackbarType.error:
        iconData = Icons.error_outline;
        break;
      case SnackbarType.warning:
        iconData = Icons.warning;
        break;
      case SnackbarType.info:
        iconData = Icons.info_outline;
        break;
      case SnackbarType.other:
        iconData = Icons.info_outline;
        break;
    }
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black87),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12.0),
          Icon(iconData, color: Colors.white),
          const SizedBox(width: 8.0),
          Expanded(child: AppText(message, pv: 10, ph: 8).white()),
          const SizedBox(width: 12.0),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      positionedToastBuilder: (context, child, gravity) {
        return Stack(
          children: [
            Positioned(
              top: 16.0,
              right: 0,
              left: 0,
              child: child,
            ),
          ],
        );
      },
    );

    // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: const Duration(seconds: 3),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(top: 16.0, left: 0, right: 0, child: child);
    //     });
  }

  static void notification({
    required BuildContext context,
    String? title,
    required String message,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black87),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AnimatedLinearProgressBar(duration: Duration(seconds: 10)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 12.0),
              const Icon(Icons.notifications, color: Colors.white),
              const SizedBox(width: 8.0),
              Expanded(child: AppText(message, pv: 10, ph: 8).white().start()),
              const SizedBox(width: 12.0),
            ],
          ),
          //create linear progress bar with animation duration 10 seconds

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => fToast.removeCustomToast(),
                child: AppText(Strings().dismiss,
                        pv: 10, ph: 8, color: Colors.blue[300])
                    .footer(),
              ),
            ],
          ),
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 10),
        positionedToastBuilder: (context, child , gravity) {
          return Positioned(top: 16.0, left: 0, right: 0, child: child);
        });
  }
}

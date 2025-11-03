import '../../../../../core/presentation/widgets/app_text.dart';
import '../../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';

class SimpleDialogs {
  static void showErrorDialog(
    BuildContext context,
    String title,
    String description,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const SizedBox(height: 8),
                AppText(title, color: Colors.black, align: TextAlign.center)
                    .bold(),
                AppText(description,
                    color: Colors.black87, align: TextAlign.center),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  void show(
    BuildContext context,
    Widget child,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(padding: const EdgeInsets.all(12.0), child: child),
        );
      },
    );
  }

  static Future<void> showQuestionDialog({
    required BuildContext context,
    required String title,
    required String description,
    required Function onYes,
    required Function onNo,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                AppText(title, color: Colors.black, align: TextAlign.center)
                    .bold(),
                const SizedBox(height: 8),
                AppText(
                  description,
                  color: Colors.black87,
                  align: TextAlign.center,
                  height: 1.4,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        onYes();
                        Navigator.pop(context);
                      },
                      child: AppText(Strings().yes),
                    ),
                    TextButton(
                      onPressed: () {
                        onNo();
                        Navigator.pop(context);
                      },
                      child: AppText(Strings().no),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

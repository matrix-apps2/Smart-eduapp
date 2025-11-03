import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../modules/notification/data/models/notification_model.dart';
import '../../../../utils/helpers/converters/date_converter.dart';
import '../../../../utils/styles/decoration.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration()
          .radius(20)
          .customColor(const Color(0xffF9FAFB))
          .borderStyle(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _notificationTypeIcon(notification.type),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(notification.title, color: Colors.black87)
                    .start()
                    .header(),
                AppText(notification.body, color: Colors.black54).start(),
                if (notification.createdAt != null)
                  AppText(DateConverter.formatDate(notification.createdAt!),
                          color: Colors.black54)
                      .start()
                      .footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _notificationTypeIcon(String? notificationType) {
    Color color = Colors.blue;
    Icon icon = Icon(Icons.check, color: color, size: 24);
    String message = "";
    if (notificationType == "warning") {
      color = Colors.orange;
      icon = Icon(Icons.warning_amber_outlined, color: color, size: 24);
      message = Strings().warning;
    }
    if (notificationType == "danger") {
      color = Colors.red;
      icon = Icon(Icons.dangerous_outlined, color: color, size: 24);
      message = Strings().danger;
    }

    return Tooltip(
      message: message,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1), shape: BoxShape.circle),
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }
}

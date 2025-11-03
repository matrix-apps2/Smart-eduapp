import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../modules/notification/data/models/notification_model.dart';
import '../../../../modules/notification/presentation/widget/notification_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationView({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    // ترتيب الإشعارات من الأحدث للأقدم
    notifications.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    // تقسيمها حسب الأيام
    final groupedNotifications = _groupByDate(notifications);

    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: groupedNotifications.length,
        itemBuilder: (context, index) {
          final date = groupedNotifications.keys.elementAt(index);
          final items = groupedNotifications[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                _formatSectionTitle(date),
                size: 13.sp,
                color: AppCustomColors.colorGrey85,
              ),
              const SizedBox(height: 10),
              ...items.map((n) => _NotificationTile(model: n)),
              const SizedBox(height: 20),
            ],
          );
        },
      );
  }

  /// تقسيم الإشعارات حسب اليوم
  Map<DateTime, List<NotificationModel>> _groupByDate(
      List<NotificationModel> list) {
    Map<DateTime, List<NotificationModel>> map = {};
    for (var n in list) {
      final dateOnly =
      DateTime(n.createdAt!.year, n.createdAt!.month, n.createdAt!.day);
      map.putIfAbsent(dateOnly, () => []).add(n);
    }
    return map;
  }

  /// صياغة العنوان (Today / Yesterday / تاريخ)
  String _formatSectionTitle(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (date == today) return "Today";
    if (date == yesterday) return "Yesterday";
    return DateFormat('d MMMM yyyy').format(date);
  }
}

class _NotificationTile extends StatelessWidget {
  final NotificationModel model;

  const _NotificationTile({required this.model});

  Color _iconColor(String? type) {
    switch (type) {
      case 'info':
        return Colors.blue;
      case 'warning':
        return Colors.yellow.shade700;
      case 'error':
        return Colors.red;
      default:
        return Colors.teal;
    }
  }

  IconData _iconData(String? type) {
    switch (type) {
      case 'info':
        return Icons.info_outline;
      case 'warning':
        return Icons.warning_amber_outlined;
      case 'error':
        return Icons.error_outline;
      default:
        return Icons.notifications_none;
    }
  }

  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inHours < 1) return "${diff.inMinutes} min ago";
    if (diff.inHours < 24) return "${diff.inHours} H ago";
    if (diff.inDays == 1) return "Yesterday";
    return DateFormat('d MMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // أيقونة الإشعار
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _iconColor(model.type).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _iconData(model.type),
              color: _iconColor(model.type),
              size: 20.sp,
            ),
          ),
          8.widthBox,

          // محتوى الإشعار
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  model.title ?? '',
                  size: 13.sp,
                ),
                AppText(
                  model.body ?? '',
                  size: 13.sp,
                  color: AppCustomColors.colorGrey80,
                  align: TextAlign.start,
                  pv: 0,
                ),
              ],
            ),
          ),

          // الوقت
          Text(
            _timeAgo(model.createdAt ?? DateTime.now()),
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}


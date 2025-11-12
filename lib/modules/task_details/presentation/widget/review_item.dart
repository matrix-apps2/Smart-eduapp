import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../rating/data/model/rate_model.dart';

Widget buildReviewItem(RateModel review) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// ===== Header: Profile + Name + Time =====
      Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: NetworkImage(review.img!),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                review.name ?? 'Unknown User',
                size: 13.sp,
              ),
              4.heightBox,
              AppText(
                _timeAgo(review.createdAt!),
                size: 13.sp,
                pv: 0,
              ),
            ],
          ),
        ],
      ),

      8.heightBox,

      /// ===== Review Body =====
      AppText(
        review.body ?? '',
        size: 13.sp,
        pv: 0,
        align: TextAlign.start,
      ),
    ],
  ).paddingSymmetric(vertical: 8);
}

String _timeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inMinutes < 60) {
    return '${diff.inMinutes}m ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours}h ago';
  } else {
    return '${diff.inDays}d ago';
  }
}
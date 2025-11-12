import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/model/client_testimonial_model.dart';


class QualificationCardWidget extends StatelessWidget {
  final ClientTestimonialModel model;

  const QualificationCardWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0XFFFFEC85)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// --- Profile Row ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 24.r,
                backgroundImage: model.image != null
                    ? NetworkImage(model.image!)
                    : const AssetImage('assets/images/default_user.png')
                as ImageProvider,
              ),
              SizedBox(width: 12.w),
              // Name + Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name ?? "Client Name Goes Here",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    _getTimeAgo(model.date),
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 8.h),

          /// --- Rating stars ---
          Row(
            children: List.generate(5, (index) {
              bool filled = model.rate != null && index < model.rate!.round();
              return Icon(
                Icons.star,
                size: 18.sp,
                color: filled ? Colors.orange : Colors.grey[300],
              );
            }),
          ),

          SizedBox(height: 8.h),

          /// --- Comment ---
          Text(
            model.comment ??
                '"Thanks to their professionalism, I was able to complete my university thesis in record time."',
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.4,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime? date) {
    if (date == null) return "Just now";
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 60) return "${diff.inMinutes} min ago";
    if (diff.inHours < 24) return "${diff.inHours} h ago";
    if (diff.inDays < 30) return "${diff.inDays} d ago";
    return DateFormat('yMMMd').format(date);
  }
}

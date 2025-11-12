import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String image;

  const ServiceCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: () {
        AppNavigation.toNamed(Routes.serviceDetailsScreen);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppCustomColors.colorGrey5,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// الصورة
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r),bottom: Radius.circular(16.r)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 156.h,
              ),
            ),

            /// النص
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

class BlogCardWidget extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  final double imgHeight;

  const BlogCardWidget({super.key, required this.title, required this.date, required this.image, this.imgHeight = 156});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: () {
        AppNavigation.toNamed(Routes.blogDetailsScreen);
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
                height: imgHeight.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:8.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  8.heightBox,
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: AppCustomColors.appPrimaryColor, size: 12.sp,),
                      4.widthBox,
                      Text(
                        date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
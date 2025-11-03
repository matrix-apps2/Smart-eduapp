import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../../../../utils/routes/app_routes.dart';

class MyStatusScreen extends StatelessWidget {
  const MyStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: SafeArea(
          child: Container(
            // height: 42.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Image.asset(
                    AppImagePath.logo,
                    height: 40.h,
                    width: 48.w,
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      AppImagePath.chat,
                      height: 30,
                    ),
                  ),
                  onPressed: () {
                    AppNavigation.toNamed(Routes.chatsScreen);
                  },
                ),
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      AppImagePath.ring,
                      height: 30,
                    ),
                  ),
                  onPressed: () {
                    AppNavigation.toNamed(Routes.notificationScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== Tasks Section =====
            AppText(
              "Tasks",
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),

            /// All Tasks Box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText("All Tasks", size: 15.sp),
                  AppText("0", size: 15.sp, fontWeight: FontWeight.w700, color: AppCustomColors.appPrimaryColor,),
                ],
              ),
            ),
            const SizedBox(height: 12),

            /// Task Status Grid
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: [
                taskStatusBox("Pending", 0),
                taskStatusBox("On Going", 0),
                taskStatusBox("In Review", 0),
                taskStatusBox("Returned", 0),
                taskStatusBox("Delivered", 0),
                taskStatusBox("Rejected", 0),
              ],
            ),

            24.heightBox,

            /// ===== Overall Rating =====
            AppText(
              "Overall Rating",
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            10.heightBox,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightYellow5,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImagePath.ratingLeft),
                      AppText(
                        "4.0",
                        size: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                      Image.asset(AppImagePath.ratingRight),
                    ],
                  ),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) => Icon(
                        index < 4 ? Icons.star_rounded : Icons.star_outline_rounded,
                        color: AppCustomColors.amberColor,
                        size: 22.sp,
                      ),
                    ),
                  ),
                  8.heightBox,
                  Divider(color: AppCustomColors.colorLightGrey10, height: .5.h,),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText("Based on 125 reviews", size: 13.sp,),
                      GestureDetector(
                        onTap: () => AppNavigation.toNamed(Routes.ratingOverviewScreen),
                        child: Row(
                          children: [
                            AppText(
                              "View Rating",
                              size: 13.sp,
                            ),
                            Icon(Icons.arrow_forward_rounded, size: 16.sp),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            24.heightBox,

            /// ===== Earnings Overview =====
            AppText(
              "Earnings Overview",
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppCustomColors.colorGrey15,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  AppText(
                    "Total Earnings",
                    size: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  4.heightBox,
                  AppText(
                    "\$0.00",
                    fontWeight: FontWeight.w700,
                    size: 21.sp,
                    color: AppCustomColors.appPrimaryColor,
                  ),
                  12.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      earningsBox,
                      earningsBox,
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

  /// ===== Widget for Task Box =====
  Widget taskStatusBox(String title, int count) {
    return Container(
      decoration: BoxDecoration(
        color: AppCustomColors.colorGrey5,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(title, size: 15.sp,),
          const SizedBox(height: 4),
          AppText(count.toString(),
              color: AppCustomColors.appPrimaryColor, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  /// ===== Widget for Earnings Box =====
  static const Widget earningsBox = _EarningsBox();
}

class _EarningsBox extends StatelessWidget {
  const _EarningsBox();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText("Available Balance", size: 13.sp, fontWeight: FontWeight.w400,),
        4.heightBox,
        AppText("\$0.00", size: 13.sp, fontWeight: FontWeight.w700,),
      ],
    );
  }
}


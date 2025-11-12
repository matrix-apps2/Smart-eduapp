import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/component.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../../../../core/presentation/widgets/app_text.dart';

class GuestMoreScreen extends StatelessWidget {
  const GuestMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'More', isBackButtonExist: false,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppCustomColors.colorGrey15,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🟦 Logo
                Image.asset(
                  AppImagePath.logo,
                  height: 80.h,
                ),
                SizedBox(height: 16.h),

                // 🧾 Title & subtitle
                AppText(
                  "Join Smart, unlock your potential",
                  // textAlign: TextAlign.center,
                  size: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 8.h),
                AppText(
                  "Sign up or log in to get a personalized experience tailored to your skills and preferences.",
                  // textAlign: TextAlign.center,
                  size: 15.sp,
                  color: AppCustomColors.colorGrey80,
                  // height: 1.4,
                ),
                SizedBox(height: 20.h),

                // 🟢 Sign Up button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: AppButton(
                    onTap: () {},
                    title: "Sign Up",
                    borderRadius: 12.r,
                    textColor: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),

                // 🔹 Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      "Already have an account? ",
                      size: 17.sp, color: Colors.black87,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AppText(
                        "Log In",
                        size: 17.sp,
                        color: AppCustomColors.appPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // 📄 Info items
          _buildInfoItem(Icons.info_outline, "About Us", onTap: () {
            AppNavigation.toNamed(Routes.aboutUsScreen);
          }),
          _buildInfoItem(Icons.phone_in_talk_outlined, "Contact Us", onTap: () {
            AppNavigation.toNamed(Routes.contactUsScreen);
          }),
          _buildInfoItem(Icons.verified_user_outlined, "Terms & Conditions", onTap: () {
            AppNavigation.toNamed(Routes.termsAndConditionsScreen);
          }),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, {required VoidCallback onTap}) {
    return Container(
      padding: REdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppCustomColors.colorGrey5, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppCustomColors.appPrimaryColor.withOpacity(.05),
              borderRadius: BorderRadius.circular(12.r)
            ),
            child: Icon(icon, color: AppCustomColors.appPrimaryColor)),
        title: Text(
          title,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right_rounded, color: Colors.black45),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        dense: true,
        minLeadingWidth: 28.w,
      )
    ).paddingSymmetric(horizontal: 20.w, vertical: 4.h);
  }
}

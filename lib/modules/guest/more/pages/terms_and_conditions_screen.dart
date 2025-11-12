import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/core/presentation/widgets/component/custom_app_bar.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Terms & Conditions',
        onBackPress: () => AppNavigation.goBack(),
        rightIcon: Image.asset(AppImagePath.logo, height: 28.h),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Last Updated: 15 Jan, 2025',
              size: 14.sp,
              color: Colors.grey[700],
              align: TextAlign.start,
            ),
            // 12.heightBox,
            AppText(
              'Please read these Terms & Conditions (“Terms”) carefully before using the Smart mobile application. '
                  'By accessing or using the App, you agree to be bound by these Terms. '
                  'If you do not agree to these Terms, do not access or use the App.',
              size: 15.sp,
              color: AppCustomColors.appTextColor,
              align: TextAlign.start,
              height: 1.6,
            ),

            _sectionTitle('1. Acceptance of Terms'),
            _sectionBody(
              'By using the App, you acknowledge that you have read, understood, and agree to be bound by these Terms, our Privacy Policy, and any additional terms and conditions that may apply to specific features or services within the App.',
            ),

            _sectionTitle('2. Use of the App'),
            _bullet('You must be at least [Age] years old to use the App.'),
            _bullet('You agree to use the App only for lawful purposes and in a manner that does not infringe the rights of, restrict, or inhibit anyone else\'s use and enjoyment of the App.'),
            _bullet('You are responsible for maintaining the confidentiality of your account credentials and all activities under your account.'),

            _sectionTitle('3. Prohibited Conduct'),
            _sectionBody('You agree not to:'),
            _bullet('Use the App in any way that could damage, disable, overburden, or impair it.'),
            _bullet('Attempt to gain unauthorized access to any part of the App, other accounts, computer systems, or networks connected to the App.'),
            _bullet('Use the App to transmit viruses, worms, or other malicious code.'),
            _bullet('Collect or harvest any personally identifiable information from the App without our express written permission.'),
            _bullet('Impersonate any person or entity or misrepresent your affiliation with any person or entity.'),

            30.heightBox,

            // Center(
            //   child: ElevatedButton(
            //     onPressed: () => AppNavigation.goBack(),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: AppCustomColors.mainColor,
            //       padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.r),
            //       ),
            //     ),
            //     child: AppText(
            //       'Accept & Continue',
            //       color: Colors.white,
            //       size: 16.sp,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, bottom: 6.h),
      child: AppText(
        title,
        size: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _sectionBody(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: AppText(
        text,
        size: 15.sp,
        color: AppCustomColors.appTextColor,
        align: TextAlign.start,
        height: 1.6,
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            '• ',
            size: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          Expanded(
            child: AppText(
              text,
              size: 15.sp,
              color: AppCustomColors.appTextColor,
              align: TextAlign.start,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

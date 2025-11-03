import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/widgets/custom_checkbox_group.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';

class Preferences extends StatefulWidget {

  const Preferences({
    super.key,
  });

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isBackButtonExist: true, title: 'Preferences',),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Shape Your Success.', fontWeight: FontWeight.w700, size: 17.sp, align: TextAlign.start,),
            AppText('Help us customize your experience. Select your preferences to receive tasks that are a perfect fit for you.', size: 15.sp, align: TextAlign.start,),
            AppText('You can choose more than one.', size: 15.sp, align: TextAlign.start),

            8.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightBlue5,
              ),
              child: AppText('Specializations', size: 15, fontWeight: FontWeight.w400, pv: 6,),
            ),
            8.heightBox,
            CustomCheckBoxGroup(options: [
              'Business', 'Statistics', 'Civil Engineering',
              'Mechanical Engineering'
            ], onChanged: (selectedItems){}),

            10.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightBlue5,
              ),
              child: AppText('Budget for tasks', size: 15, fontWeight: FontWeight.w400, pv: 6,),
            ),
            8.heightBox,
            CustomCheckBoxGroup(options: ['Less than \$200', '\$200 - \$500', 'More than \$500'],
                onChanged: (selectedItems){}),

            10.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightBlue5,
              ),
              child: AppText('Task types you are interested in', size: 15, fontWeight: FontWeight.w400, pv: 6,),
            ),
            8.heightBox,
            CustomCheckBoxGroup(options: [
              'Research and studies', 'Data analysis', 'Design',
              'Academic writing'
            ], onChanged: (selectedItems){}),

            10.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightBlue5,
              ),
              child: AppText('Task types you would prefer not to work on', size: 15, fontWeight: FontWeight.w400, pv: 6,),
            ),
            8.heightBox,
            CustomCheckBoxGroup(options: [
              'Statistical analysis', 'Research plan', 'Theoretical framework',
              'Statistical analysis'
            ], onChanged: (selectedItems){}),

            10.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightBlue5,
              ),
              child: AppText('Preferred working hours', size: 15, fontWeight: FontWeight.w400, pv: 6,),
            ),
            8.heightBox,
            CustomCheckBoxGroup(options: [
              'Morning', 'Evening', 'Flexible'
            ], onChanged: (selectedItems){}),

            10.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightBlue5,
              ),
              child: AppText('Your experience level', size: 15, fontWeight: FontWeight.w400, pv: 6,),
            ),
            8.heightBox,
            CustomCheckBoxGroup(options: [
              'Beginner', 'Intermediate', 'Expert'
            ], onChanged: (selectedItems){}),

            24.heightBox,
            AppButton(
              onTap: () {
                AppNavigation.toNamed(Routes.successfulScreen);
              },
              // height: 40.h,
              isRounded: false,
              title: "Continue",
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              textColor: Colors.black,
              color: AppCustomColors.appPrimaryColor,
            ),
            8.heightBox,
            AppButton(
              onTap: () {},
              // height: 40.h,
              isRounded: false,
              borderColor: Colors.transparent,
              title: "Skip Now",
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              textColor: Colors.black,
              color: AppCustomColors.colorLightBlue5,
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
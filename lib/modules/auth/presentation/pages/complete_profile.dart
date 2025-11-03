import 'dart:async';


import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../app.dart';
import '../../../../awesome_extension_package/awesome_extensions.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../core/presentation/widgets/dialog/base/simple_dialogs.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/auth/logic/password/password_cubit.dart';
import '../../../../modules/auth/logic/verify_account/verify_account_cubit.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:dartz/dartz.dart' as dartz;

class CompleteProfile extends StatefulWidget {

  const CompleteProfile({
    super.key,
  });

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isBackButtonExist: true, title: 'Complete Profile',),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gap(20.h),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.r),
                  child: Container(
                    padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppCustomColors.colorGrey5
                      ),
                      child: Image.asset(AppImagePath.profile)),
                ).toCenter(),

                Positioned(
                  bottom: 1,
                  right: -50,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppCustomColors.colorGrey5, width: 1)
                    ),
                    child: Image.asset(AppImagePath.editImg),
                  ).toCenter(),
                )
              ],
            ),
        
            AppText(
              'Bio'.tr(),
            ),

            2.heightBox,
            EditText(
              hint: "Write your bio here...",
              minLines: 3,
              maxLines: 3,
              lines: 1,
              controller: _bioController,
            ),

            4.heightBox,
            AppText(
              'Specialize'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Select option',
                  controller: _countryController,
                  // prefixImage: AppImagePath.locationPin,
                  suffixWidget: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),

            4.heightBox,
            AppText(
              'Currency'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Select option',
                  controller: _countryController,
                  // prefixImage: AppImagePath.locationPin,
                  suffixWidget: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),

            4.heightBox,
            AppText(
              'Qualification'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Select option',
                  controller: _countryController,
                  // prefixImage: AppImagePath.locationPin,
                  suffixWidget: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),

            4.heightBox,
            AppText(
              'Tasks Language'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Select option',
                  controller: _countryController,
                  // prefixImage: AppImagePath.locationPin,
                  suffixWidget: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),

            4.heightBox,
            AppText(
              'Gender'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Select option',
                  controller: _countryController,
                  // prefixImage: AppImagePath.locationPin,
                  suffixWidget: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),
            4.heightBox,
        
            AppText(
              'Date of Birth'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Select option',
                  controller: _countryController,
                  // prefixImage: AppImagePath.locationPin,
                  suffixWidget: Image.asset(AppImagePath.calender,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),
        
            AppText(
              'CV'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Upload Your CV',
                  textFieldColor: AppCustomColors.colorGrey15,
                  radius: 0,
                  controller: _countryController,
                  suffixWidget: Image.asset(AppImagePath.download,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),

           4.heightBox,
            AppText(
              'Previous Works'.tr(),
            ),
            2.heightBox,
            GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: EditText(
                  hint: 'Upload Examples of Previous Works',
                  controller: _countryController,
                  radius: 0,
                  textFieldColor: AppCustomColors.colorGrey15,
                  suffixWidget: Image.asset(AppImagePath.download,),
                  // validateFunc: _validateEmail,
                ),
              ),
            ),

            24.heightBox,
            AppButton(
              onTap: () {
                AppNavigation.toNamed(Routes.preferences);
              },
              // height: 40.h,
              isRounded: false,
              title: "Complete Profile",
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

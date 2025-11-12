import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/text_required.dart';

class ServiceRequestScreen extends StatelessWidget {
  ServiceRequestScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final TextEditingController _messageController= TextEditingController();
  final TextEditingController _fullNameController= TextEditingController();
  final TextEditingController _requestTitleController= TextEditingController();
  final TextEditingController _phoneController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Request a Service',
        // onBackPress: ()=> AppNavigation.goBack(),
        isBackButtonExist: false,
        rightIcon: GestureDetector(
          onTap: () => AppNavigation.goBack(),
          child: Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppCustomColors.appWhiteColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(AppIcons.close, colorFilter: ColorFilter.mode(Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Request Your Service', fontWeight: FontWeight.w700, size: 15.sp,),
            AppText('Please fill out the form below to submit your request. Our team will contact you as soon as possible.', size: 15.sp, color: AppCustomColors.appTextColor, align: TextAlign.start,),
            // AppText('We’re just a message away!', size: 15.sp,),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRequired(
                    text: 'Request Title',
                    text2: '*',
                  ).paddingOnly(top: 24.h, bottom: 8.h),
                  EditText(
                    hint: 'Write your request title here...',
                    type: TextInputType.text,
                    controller: _requestTitleController,
                    // validateFunc: _validateEmail,
                    // prefixImage: SvgPicture.asset(AppIcons.email, colorFilter: ColorFilter.mode(AppCustomColors.appSubText, BlendMode.srcIn)),
                  ),

                  TextRequired(
                    text: 'Required Service',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    child: CustomDropDown(
                      hint: "Select Service...",
                      items: [
                        DropdownMenuItem(value: "op1", child: Text("Service 1").tr()),
                        DropdownMenuItem(
                            value: "op2", child: Text("Service 2").tr()),
                      ],
                      onChanged: (value) {
                        print('valueeeeeeee: ${value}');
                      },
                    ),
                  ),

                  TextRequired(
                    text: 'Full Name',
                    text2: '*',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  EditText(
                    hint: 'Enter full name here...',
                    type: TextInputType.text,
                    controller: _fullNameController,
                    // validateFunc: _validateEmail,
                    // prefixImage: SvgPicture.asset(AppIcons.email, colorFilter: ColorFilter.mode(AppCustomColors.appSubText, BlendMode.srcIn)),
                  ),

                  TextRequired(
                    text: 'Country',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    child: CustomDropDown(
                      hint: "Select Country...",
                      items: [
                        DropdownMenuItem(value: "op1", child: Text("Country 1").tr()),
                        DropdownMenuItem(
                            value: "op2", child: Text("Country 2").tr()),
                      ],
                      onChanged: (value) {
                        print('valueeeeeeee: ${value}');
                      },
                    ),
                  ),

                  TextRequired(
                    text: 'mobileNumber'.tr(),
                    text2: ' *',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 44.h,
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: AppCustomColors.cardColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                '966+',
                                size: 13.sp,
                                height: 0,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                              4.widthBox,
                              Icon(Icons.keyboard_arrow_down_outlined),
                            ],
                          ),
                        ),
                      ),
                      8.widthBox,
                      SizedBox(
                        width: 240.w,
                        child: EditText(
                          hint: '(XXX) xx xxxx xxxx',
                          type: TextInputType.phone,
                          controller: _phoneController,
                          // validateFunc: _validatePhone,
                        ),
                      ),
                    ],
                  ),

                  TextRequired(
                    text: 'Stage',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    child: CustomDropDown(
                      hint: "Select stage or level...",
                      items: [
                        DropdownMenuItem(value: "op1", child: Text("Level 1").tr()),
                        DropdownMenuItem(
                            value: "op2", child: Text("Level 2").tr()),
                      ],
                      onChanged: (value) {
                        print('valueeeeeeee: ${value}');
                      },
                    ),
                  ),

                  TextRequired(
                    text: 'Description',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  EditText(
                    hint: 'Write request description here...',
                    controller: _messageController,
                    lines: 3,
                  ).paddingOnly(bottom: 16),

                  AppText(
                    'Attachments',
                    size: 15.sp,
                    align: TextAlign.start,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppCustomColors.colorLightGreen5,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            'Attach File',
                            size: 15.sp,
                            align: TextAlign.start,
                          ),
                        ),
                        Image.asset(AppImagePath.download),
                      ],
                    ),
                  ),
                  32.heightBox,

                  AppButton(onTap: (){
                    showDialog(context: context, builder: (context){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImagePath.successUpdate).paddingOnly(bottom: 24),
                            AppText('Request Sent Successfully!', size: 17.sp, fontWeight: FontWeight.w700,),
                            AppText('Thank you for your interest. A member of our team will contact you soon to discuss your request.',
                              size: 17.sp, color: AppCustomColors.colorGrey80,),
                          ],
                        ),
                      ).paddingSymmetric(horizontal: 20, vertical: 208);
                    });
                  },
                    title: 'Submit',
                    color: AppCustomColors.appPrimaryColor,
                    textColor: Colors.black,).paddingOnly(bottom: 16)
                ],
              ),
            ),

          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

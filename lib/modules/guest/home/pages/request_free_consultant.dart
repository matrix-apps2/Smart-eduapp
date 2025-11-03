import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/widgets/text_required.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../my_tasks/presentation/widgets/filter.dart';


class RequestFreeConsultant extends StatefulWidget {
  const RequestFreeConsultant({super.key});

  @override
  State<RequestFreeConsultant> createState() => _RequestFreeConsultantState();
}

class _RequestFreeConsultantState extends State<RequestFreeConsultant> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _messageController= TextEditingController();
  TextEditingController _fullNameController= TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _phoneController= TextEditingController();
  TextEditingController _specializationController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Request a Free Consultation',
        onBackPress: ()=> AppNavigation.goBack(),
        rightIcon: Image.asset(AppImagePath.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Get a free consultation', fontWeight: FontWeight.w700, size: 15.sp,),
            AppText('Register your details, and one of our specialists will contact you.', size: 15.sp, color: AppCustomColors.appTextColor, align: TextAlign.start,),
            AppText('We’re just a message away!', size: 15.sp,),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRequired(
                    text: 'Full Name',
                    text2: '*',
                  ).paddingOnly(top: 24.h, bottom: 8.h),
                  EditText(
                    hint: 'Enter full name here...',
                    type: TextInputType.emailAddress,
                    controller: _emailController,
                    // validateFunc: _validateEmail,
                    // prefixImage: SvgPicture.asset(AppIcons.email, colorFilter: ColorFilter.mode(AppCustomColors.appSubText, BlendMode.srcIn)),
                  ),
                  TextRequired(
                    text: 'Email Address',
                    text2: '*',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  EditText(
                    hint: 'Enter Your Email'.tr(),
                    type: TextInputType.emailAddress,
                    controller: _emailController,
                    // validateFunc: _validateEmail,
                    // prefixImage: SvgPicture.asset(AppIcons.email, colorFilter: ColorFilter.mode(AppCustomColors.appSubText, BlendMode.srcIn)),
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
                    text: 'Specialization',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  EditText(
                    hint: 'Write your specialization here...',
                    controller: _specializationController,
                  ),

                  TextRequired(
                    text: 'Message',
                  ).paddingOnly(top: 16.h, bottom: 8.h),
                  EditText(
                    hint: 'Write your message here...',
                    controller: _messageController,
                    lines: 3,
                  ).paddingOnly(bottom: 16),

                  AppButton(onTap: (){},
                  title: 'Send', color: AppCustomColors.appPrimaryColor, textColor: Colors.black,).paddingOnly(bottom: 16)
                ],
              ),
            ),

          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

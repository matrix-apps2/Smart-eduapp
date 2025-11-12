import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/contact_us/logic/contact_us/contact_us_cubit.dart';
import '../../../../modules/contact_us/presentation/contact_us_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/app_text.dart';
import '../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../utils/routes/navigation_services.dart';
import '../../../utils/theme/appColors.dart';
import '../../../utils/theme/appImages.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/text_required.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _messageController= TextEditingController();
  TextEditingController _fullNameController= TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _phoneController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Contact Us',
        onBackPress: ()=> AppNavigation.goBack(),
        rightIcon: Image.asset(AppImagePath.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('We\'re Here to Help!', fontWeight: FontWeight.w700, size: 15.sp,),
            AppText('Do you have any questions, feedback, or need assistance? Reach out to us using the information below. Our team is ready to support you.', size: 15.sp, color: AppCustomColors.appTextColor, align: TextAlign.start,),
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
                    type: TextInputType.text,
                    controller: _fullNameController,
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

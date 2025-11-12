import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/resources/resources.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Service Details',
        onBackPress: ()=> AppNavigation.goBack(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                AppImagePath.serviceImg,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 336.h,
              ),
            ).paddingSymmetric(vertical: 8.h),
        
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: AppCustomColors.appPrimaryColor, width: 1.w)),
                gradient: LinearGradient(colors: [
                  AppCustomColors.colorLightBlue5.withOpacity(.5),
                  AppCustomColors.appWhiteColor
                ])
              ),
              child: AppText('Writing Academic Research', size: 17.sp, fontWeight: FontWeight.w700, color: AppCustomColors.appPrimaryColor,),
            ),
            AppText('We offer professional services in preparing academic research for undergraduate, master\'s, and postgraduate students. We also assist distance and affiliated students in Saudi Arabia, the UAE, Kuwait, Oman, and Bahrain. We understand the challenges students face in writing research that adheres to university standards, and for that reason, we are your trusted academic partner.',
            size: 15.sp, color: AppCustomColors.appTextColor, align: TextAlign.start,),
            AppText('What we offer:', fontWeight: FontWeight.w700, size: 15.sp, align: TextAlign.start,),
            _offerItem('Choosing a modern research topic that aligns with the field of study.'),
            _offerItem('Writing a comprehensive research plan (problem, objectives, questions, hypotheses).'),
            _offerItem('Gathering recent and reliable Arabic and foreign academic references and sources.'),
          ],
        ).paddingSymmetric(horizontal: 20.w,),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: AppButton(
              onTap: () {
                AppNavigation.toNamed(Routes.requestFreeConsultant);
              },
              title: 'Consultation'.tr(),
              color: AppCustomColors.colorLightBlue5,
              textColor: AppCustomColors.blackColor,
              fontWeight: FontWeight.w700,
              isRounded: false,
              borderRadius: 12.r,
              borderColor: Colors.transparent,
            ),
          ),

          8.widthBox,
          Expanded(
            child: AppButton(
              onTap: () {
                AppNavigation.toNamed(Routes.serviceRequestScreen);
              },
              title: 'Order now'.tr(),
              color: AppCustomColors.appPrimaryColor,
              textColor: AppCustomColors.blackColor,
              fontWeight: FontWeight.w700,
              isRounded: false,
              borderRadius: 12.r,
            ),
          ),

        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }

  Row _offerItem(String offer) {
    return Row(
            children: [
              SvgPicture.asset(AppIcons.rightMark),
              8.widthBox,
              Expanded(child: AppText(offer, size: 15.sp, align: TextAlign.start,))
            ],
          );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/component.dart';
import 'package:smart_operation/modules/guest/data/model/core_service_model.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../data/model/client_testimonial_model.dart';
import '../../data/model/qualifications_model.dart';
import '../widget/qualification_card_widget.dart';

class GuestHomeScreen extends StatelessWidget {
  GuestHomeScreen({super.key});

  final List<CoreServiceModel> dummyServices = [
    CoreServiceModel(image: AppImagePath.masterService, title: 'Master\'s & PhD Services', color: Color(0XFFD0F1A5)),
    CoreServiceModel(image: AppImagePath.underGradService, title: 'Undergraduate Services', color: Color(0XFFF4D1FD)),
    CoreServiceModel(image: AppImagePath.variousServices, title: 'Various Services', color: Color(0XFFEDD39A)),
  ];

  final List<QualificationsModel> dummyQualifications = [
    QualificationsModel(image: AppIcons.teamIcon, title: 'Expert Team', subTitle: 'A specialized team of academics and researchers.'),
    QualificationsModel(image: AppIcons.qualityIcon, title: 'Prioritize Quality', subTitle: 'Ensuring the highest standards of quality and professionalism.'),
    QualificationsModel(image: AppIcons.timeIcon, title: 'Timely Delivery', subTitle: 'Delivering projects efficiently and on schedule.'),
  ];

  final List<ClientTestimonialModel> dummyData = [
    ClientTestimonialModel(
      id: 1,
      name: "John Doe",
      date: DateTime.now().subtract(Duration(hours: 1)),
      rate: 4,
      comment:
      "Thanks to their professionalism, I was able to complete my university thesis in record time.",
      image: "https://randomuser.me/api/portraits/men/11.jpg",
    ),
    ClientTestimonialModel(
      id: 2,
      name: "Sarah Johnson",
      date: DateTime.now().subtract(Duration(days: 2)),
      rate: 5,
      comment: "Excellent service and very supportive team!",
      image: "https://randomuser.me/api/portraits/women/12.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 152.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0XFF00428A),
                      Color(0XFF0086CD),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(AppImagePath.circlesAppBar),
                    fit: BoxFit.cover,
                    opacity: 0.1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 52.h),
                      child: Image.asset(
                        AppImagePath.smartAppLogo,
                        height: 40.h,
                      ),
                    ),
          
                    12.heightBox,
                    Expanded(
                      child: SizedBox(
                        height: 150.h,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: -100.h,
                              child: Container(
                                height: 148.h,
                                width: 336.w,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF0295DD).withOpacity(0),
                                      Color(0xFF0295DD).withOpacity(.05),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  border: Border.all(
                                    color: Color(0x800EA7E9),
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText('Partnering for Your Academic Success', size: 13.sp, fontWeight: FontWeight.w700, color: AppCustomColors.appWhiteColor,),
                                          Spacer(),
                                          AppText('We offer professional research and academic writing services.', size: 11.sp),
                                          8.heightBox,
                                          AppButton(onTap: (){},
                                            color: AppCustomColors.colorLightBlue5,
                                            textColor: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11.sp,
                                            title: 'Request a Free Consultation',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(flex: 2,),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 25.w),
                            ),
                            Positioned(
                                right: 16.w,
                                top: -45.h,
                                child: Image.asset(AppImagePath.guestAppbarImage, fit: BoxFit.fill, width: 116.w, height: 192.h,))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              152.heightBox,
          
              AppText('Our Core Services', size: 13.sp, fontWeight: FontWeight.w700,).paddingSymmetric(horizontal:20.w),
              4.heightBox,
          
              Container(
                height: 164.h,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyServices.length,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    final service = dummyServices[index];
                    return Container(
                      width: 104.w,
                      margin: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: service.color?? Colors.grey.withOpacity(0.5),
                          width: 0.5.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: service.color?.withOpacity(0.1)??Colors.black.withOpacity(0.1),
                            blurRadius: 4.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                        color: service.color?.withOpacity(0.1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // الصورة مع خلفية دائرية
                          Image.asset(
                            service.image ?? '',
                            fit: BoxFit.cover,
                            height: 56.h,
                            width: 56.w,
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              service.title ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          AppButton(onTap: (){},
                            height: 36.h,
                            // isRounded: true,
                            color: AppCustomColors.appWhiteColor,
                            borderColor: AppCustomColors.appPrimaryColor,
                            title: 'Discover',
                            borderWidth: 1.w,
                            textColor: AppCustomColors.appPrimaryColor,
                          ).paddingAll(8),
                        ],
                      ),
                    );
                  },
                ),
              ),
          
              12.heightBox,
              AppText('Why We Are Your First Choice', size: 13.sp, fontWeight: FontWeight.w700,).paddingSymmetric(horizontal:20.w),
              4.heightBox,
          
              Container(
                height: 164.h,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyQualifications.length,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    final qualification = dummyQualifications[index];
                    return Container(
                      width: 135.w,
                      margin: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppCustomColors.appPrimaryColor.withOpacity(0.5),
                          width: 0.5.w,
                        ),
                        color: AppCustomColors.appWhiteColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // الصورة مع خلفية دائرية
                          SizedBox(
                            height: 25.h,
                            child: SvgPicture.asset(
                              qualification.image ?? '',
                              height: 24.h,
                              width: 24.w,
                            ).paddingSymmetric(horizontal: 8),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            qualification.title ?? '',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
          
                          AppText(
                            qualification.subTitle ?? '',
                            align: TextAlign.start,
                            size: 13.sp,
                            color: AppCustomColors.colorGrey80,
                            ph: 0,
                          ),
                        ],
                      ).paddingAll(8),
                    );
                  },
                ),
              ),

              12.heightBox,
              AppText('Client Testimonials', size: 13.sp, fontWeight: FontWeight.w700,).paddingSymmetric(horizontal:20.w),
              4.heightBox,

              Container(
                height: 144.h,
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.builder(
                  // padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                  itemCount: dummyData.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    return QualificationCardWidget(model: dummyData[index]);
                  },
                ),
              ),
              4.heightBox,

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFF0295DD).withOpacity(0.05),
                    Color(0XFF0295DD).withOpacity(0),
                  ]),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppCustomColors.appPrimaryColor, width: .5.w)
                ),
                child: Column(
                  children: [
                    Text(
                      "Ready to take the next step?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        // color: const Color(0xFF00428A),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Our dedicated and expert team is ready to help you\nachieve your academic goals.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// --- Button ---
                    InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: (){
                        AppNavigation.toNamed(Routes.requestFreeConsultant);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F4FC),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          "Request a Free Consultation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            // color: const Color(0xFF00428A),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

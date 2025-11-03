import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import '../../../core/presentation/widgets/app_text.dart';
import '../../../utils/routes/app_routes.dart';
import '../../../utils/routes/navigation_services.dart';
import '../../../utils/theme/appColors.dart';
import '../../../utils/theme/appImages.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/language_bottom_sheet.dart';
import '../../../widgets/roler_selector.dart';
import '../../../widgets/app_snackbar.dart';
import '../data/models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  String? selectedRole = '';

  final List<OnboardingModel> onBoardingList = [
    OnboardingModel(
      img: AppImagePath.onboardingImg1,
      title: 'One app, all of smart',
      subTitle:
      'One platform, complete control, manage all clients, tasks, and users seamlessly.',
    ),
    OnboardingModel(
      img: AppImagePath.onboardingImg2,
      title: 'One app, all of smart',
      subTitle: 'All-in-one platform, find projects, collaborate, and get paid.',
    ),
    OnboardingModel(
      img: AppImagePath.onboardingImg3,
      title: 'One app, all of smart',
      subTitle:
      'Recruit, manage, and pay skilled freelancers, all in one place.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppCustomColors.appPrimaryColor,
                Color(0xFFEAF6FF),
                Colors.white,
              ],
              stops: [0.0, 0.5, 0.9],
            ),
          ),
          child: Column(
            children: [
              // SizedBox(height: 24.h),
              Image.asset(
                AppImagePath.logo,
                height: 72.h,
                width: 72.w,
                color: AppCustomColors.appWhiteColor,
              ),
              // SizedBox(height: 24.h),

              // 12.heightBox,
              // Carousel
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: onBoardingList.length,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    height: 1.sh,
                  ),
                  itemBuilder: (context, index, _) {
                    final item = onBoardingList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0.0, 0.6, 1.0],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image.asset(
                                item.img,
                              ),
                            ).toCenter(),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  294.heightBox,
                                  AppText(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    align: TextAlign.center,
                                  ),
                                  SizedBox(height: 8.h),
                                  AppText(
                                    item.subTitle,
                                    size: 17.sp,
                                    height: 1.5,
                                    align: TextAlign.center,
                                    wordSpacing: 1,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  SizedBox(height: 8.h),
                                  if (selectedRole?.isEmpty ?? true)
                                    AppText(
                                      'Choose an option to get started',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppCustomColors.appPrimaryColor,
                                      ),
                                    ),
                                ],
                              ),
                            ).paddingSymmetric(horizontal: 20),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Bottom content
              Padding(
                padding: EdgeInsets.only(bottom: 18.h, top: 8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoleSelector(
                      selectedRole: selectedRole ?? '',
                      onRoleSelected: (role) {
                        setState(() => selectedRole = role);
                        if (role == "I’m a Freelancer") {
                          _carouselController.jumpToPage(1);
                        } else if (role == "I’m a Client") {
                          _carouselController.jumpToPage(2);
                        }
                      },
                    ).paddingSymmetric(horizontal: 20.w),
                    if (selectedRole?.isNotEmpty == true) ...[
                      SizedBox(height: 8.h),
                      CustomElevatedButton(
                        text: 'Get Started',
                        backgroundColor: AppCustomColors.appPrimaryColor,
                        textColor: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          if (selectedRole == "I’m a Freelancer") {
                            AppNavigation.toNamed(Routes.layout);
                          } else {
                            AppSnackbar.show(
                              context: context,
                              message: "working on it",
                            );
                          }
                        },
                      ).paddingSymmetric(horizontal: 20.w),
                    ],
                    SizedBox(height: 8.h),

                    // Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          'Already have an account?',
                          size: 15.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (selectedRole == "I’m a Freelancer") {
                              AppNavigation.toNamed(Routes.loginScreen);
                            } else {
                              AppSnackbar.show(
                                context: context,
                                message: "working on it",
                              );
                            }
                          },
                          child: AppText(
                            ' Log In',
                            size: 15.sp,
                            color: AppCustomColors.appPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    // Guest
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          'Continue as a',
                          size: 15.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            AppNavigation.toNamed(Routes.guestLayout);
                            // AppSnackbar.show(
                            //   context: context,
                            //   message: "working on it",
                            // );
                          },
                          child: AppText(
                            ' Guest',
                            size: 15.sp,
                            color: AppCustomColors.appPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    // Language
                    GestureDetector(
                      onTap: () {
                        showLanguageBottomSheet(
                          context,
                              (lang) {},
                          context.locale.languageCode,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.language,
                            // height: 16.h,
                            colorFilter: const ColorFilter.mode(
                              AppCustomColors.appGreyLight,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          AppText(
                            'English'.tr(),
                            size: 13.sp,
                            color: AppCustomColors.appGreyLight,
                          ),
                        ],
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

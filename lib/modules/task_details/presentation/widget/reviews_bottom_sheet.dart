import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';
import 'package:smart_operation/modules/rating/data/model/rate_model.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/text_required.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';
import 'edit_offer_bottom_sheet.dart';


class ReviewsBottomSheet extends StatefulWidget {
  const ReviewsBottomSheet({super.key});

  @override
  State<ReviewsBottomSheet> createState() => _ReviewsBottomSheetState();
}

class _ReviewsBottomSheetState extends State<ReviewsBottomSheet> {
  String selected = "all".tr();

  final List<RateModel> sampleReviews = [
    RateModel(
      body:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      createdAt:  DateFormat("d MMMM yyyy").parse("14 September 2024"),
    ),
    RateModel(
      body:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      createdAt:  DateFormat("d MMMM yyyy").parse("14 September 2024"),
    ),
    RateModel(
      body:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      createdAt:  DateFormat("d MMMM yyyy").parse("14 September 2024"),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: 480.h,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: AppCustomColors.appWhiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarBottomSheet(title: 'Task Reviews'.tr()).paddingOnly(bottom: 24),
              if(sampleReviews.isEmpty == true)...[
                Image.asset(
                  AppImagePath.taskReviewEmpty,
                  // height: 120,
                ),
                8.heightBox,
                AppText(
                  "No Reviews Yet!",
                  size: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 6),
                AppText(
                  "Your reviews will appear here, please come back later.",
                  align: TextAlign.center,
                  size: 17.sp,
                  color: AppCustomColors.colorGrey80,
                ).paddingSymmetric(horizontal: 23),
              ],

              if(sampleReviews.isNotEmpty == true)
                SizedBox(
                  height: MediaQuery.of(context).size.height * .55,
                  child: ListView.builder(
                    itemCount: sampleReviews.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final review = sampleReviews[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              review.body,
                              size: 13.sp,
                              height: 1.5.h,
                              align: TextAlign.start,
                            ),
                            SizedBox(height: 10.h),
                            AppText(
                              DateFormat('dd MMMM yyyy').format(review.createdAt!),
                              size: 13.sp,
                              color: AppCustomColors.greyColor,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ).paddingAll(20.r),
        ),
      ),
    );
  }
}


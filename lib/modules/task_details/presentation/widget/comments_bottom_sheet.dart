import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';
import 'package:smart_operation/modules/task_details/presentation/widget/review_item.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/small_icon_button.dart';
import '../../../../widgets/text_required.dart';
import '../../../rating/data/model/rate_model.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';
import 'edit_offer_bottom_sheet.dart';


class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  String selected = "all".tr();
  TextEditingController addMessagesController = TextEditingController();
  final List<RateModel> sampleReviews = [
    RateModel(
      id: 1,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=3',
      rating: 4.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    RateModel(
      id: 2,
      name: 'User Name',
      body: 'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=5',
      rating: 3.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    RateModel(
      id: 2,
      name: 'User Name',
      body: 'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=5',
      rating: 3.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    RateModel(
      id: 3,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=8',
      rating: 5.0,
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
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
              AppBarBottomSheet(title: 'Task Commnets'.tr()).paddingOnly(bottom: 24),
              if(sampleReviews.isEmpty == true)...[
                Image.asset(
                  AppImagePath.chatEmpty,
                  // height: 120,
                ),
                8.heightBox,
                AppText(
                  "No Task Comments Yet!",
                  size: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
                6.heightBox,
                AppText(
                  "Task comments will appear here, please come back later.",
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
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final review = sampleReviews[index];
                      return buildReviewItem(review);
                    },
                  ),
                ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 240.w,
                      height: 50.h,
                      child: EditText(
                        hint: 'write a comment...'.tr(),
                        type: TextInputType.text,
                        controller: addMessagesController,
                      ),
                    ).paddingSymmetric(horizontal: 4.w),
                  ),
                  SmallIconButton(
                    height: 50.h,
                    width: 50.w,
                    icon: AppIcons.send,
                    onTap: (){},
                    color: AppCustomColors.appPrimaryColor,
                  ),
                ],
              ).paddingSymmetric(vertical: 4),
            ],
          ).paddingAll(20.r),
        ),
      ),
    );
  }
}


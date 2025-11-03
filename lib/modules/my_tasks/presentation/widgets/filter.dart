import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/text_required.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';


class Filter extends StatefulWidget {
  const Filter({super.key, this.isForNewTasks = false});
  final bool isForNewTasks;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String selectedStatus = "all".tr();
  String selectedLang = "all".tr();

  final List<String> taskStatus = [
    "All".tr(),
    "Pending".tr(),
    "Assigned".tr(),
    "On Going".tr(),
    "In Review".tr(),
    "Returned".tr(),
    "Done".tr(),
    "Delivered".tr(),
  ];
  final List<String> tasksLanguages = [
    "All".tr(),
    "Arabic".tr(),
    "English".tr(),
  ];

  TextEditingController ofController = TextEditingController();
  TextEditingController toController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarBottomSheet(title: 'Filter by...'.tr()),
              if(!widget.isForNewTasks)...[
                AppText(
                  'Task Status'.tr(),
                  size: 13.sp,
                  color: AppCustomColors.colorGrey80,
                ).paddingSymmetric(vertical: 8.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: taskStatus.map((f) {
                    final isSelected = selectedStatus == f;

                    return SizedBox(
                      height: 35.h,
                      child: DottedBorder(
                        borderPadding: EdgeInsets.zero,
                        color: isSelected
                            ? AppCustomColors.appPrimaryColor
                            : Colors.transparent,
                        strokeWidth: 1.5,
                        dashPattern: const [7, 6],
                        radius: Radius.circular(12.r),
                        borderType: BorderType.RRect,
                        padding: EdgeInsets.zero,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: ChoiceChip(
                            showCheckmark: false,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            side: BorderSide(
                              color: isSelected
                                  ? Colors.transparent
                                  : AppCustomColors.blueColor,
                            ),
                            backgroundColor: AppCustomColors.appWhiteColor,
                            selectedColor: const Color(0xFFF0F9FF),
                            label: AppText(
                              f,
                              size: 13.sp,
                              color: AppCustomColors.appSubColor,
                            ),
                            selected: isSelected,
                            onSelected: (val) {
                              setState(() {
                                selectedStatus = f;
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ).paddingOnly(
                  top: 4.h,
                ),
              ],

              AppText(
                'Tasks Languages'.tr(),
                size: 13.sp,
                color: AppCustomColors.colorGrey80,
              ).paddingSymmetric(vertical: 8.h),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tasksLanguages.map((f) {
                  final isSelected = selectedLang == f;

                  return SizedBox(
                    height: 35.h,
                    child: DottedBorder(
                      borderPadding: EdgeInsets.zero,
                      color: isSelected
                          ? AppCustomColors.appPrimaryColor
                          : Colors.transparent,
                      strokeWidth: 1.5,
                      dashPattern: const [7, 6],
                      radius: Radius.circular(12.r),
                      borderType: BorderType.RRect,
                      padding: EdgeInsets.zero,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: ChoiceChip(
                          showCheckmark: false,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          side: BorderSide(
                            color: isSelected
                                ? Colors.transparent
                                : AppCustomColors.blueColor,
                          ),
                          backgroundColor: AppCustomColors.appWhiteColor,
                          selectedColor: const Color(0xFFF0F9FF),
                          label: AppText(
                            f,
                            size: 13.sp,
                            color: AppCustomColors.appSubColor,
                          ),
                          selected: isSelected,
                          onSelected: (val) {
                            setState(() {
                              selectedLang = f;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ).paddingOnly(
                top: 4.h,
              ),

              TextRequired(
                text: 'Specialty'.tr(),
              ).paddingOnly(top: 12.h, bottom: 4.h),
              SizedBox(
                height: 44.h,
                child: CustomDropDown(
                  hint: 'Select Option'.tr(),
                  validator: (value) {
                    if (value == null) {
                      return "Select an option";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  items: [
                    DropdownMenuItem(
                      value: "Op1",
                      child: Text("Op1", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color!),),
                    ),
                    DropdownMenuItem(
                      value: "Op2",
                      child: Text("Op2", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color!)),
                    ),
                  ],
                ),
              ).paddingOnly(top: 4.h, bottom: 12.h),

              if(widget.isForNewTasks)...[
                AppText(
                  'Tasks Price'.tr(),
                  size: 13.sp,
                  color: AppCustomColors.colorGrey80,
                ).paddingSymmetric(vertical: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'from'.tr(),
                            size: 13.sp,
                            color: AppCustomColors.appGreyLight,
                          ),
                          4.heightBox,
                          SizedBox(
                            height: 40.h,
                            child: EditText(
                              hint: '000',
                              controller: ofController,
                              lines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    4.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'to'.tr(),
                            size: 13.sp,
                            color: AppCustomColors.appGreyLight,
                          ),
                          4.heightBox,
                          SizedBox(
                            height: 40.h,
                            child: EditText(
                              hint: '000',
                              controller: ofController,
                              lines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: 24.h),
              ],

              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {},
                      title: 'Clear All Filters'.tr(),
                      height: 48.h,
                      color: AppCustomColors.colorLightBlue5,
                      textColor: AppCustomColors.blackColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                      borderColor: Colors.transparent,
                    ),
                  ),

                  8.widthBox,
                  Expanded(
                    child: AppButton(
                      onTap: () {},
                      title: 'Apply'.tr(),
                      height: 48.h,
                      color: AppCustomColors.appPrimaryColor,
                      textColor: AppCustomColors.blackColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                    ),
                  ),

                ],
              ),
            ],
          ).paddingAll(20.r),
        ),
      ),
    );
  }
}

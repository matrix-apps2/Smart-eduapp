import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';

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


class OfferBottomSheet extends StatefulWidget {
  const OfferBottomSheet({super.key});

  @override
  State<OfferBottomSheet> createState() => _OfferBottomSheetState();
}

class _OfferBottomSheetState extends State<OfferBottomSheet> {
  String selected = "all".tr();
  final TextEditingController _dateController = TextEditingController();


  // final List<String> experience = [
  //   "all".tr(),
  //   "5+Years".tr(),
  //   "NoExperience(WillingToLearn)".tr(),
  //   "1+Year".tr(),
  //   "2+Years".tr(),
  //   "3+Years".tr(),
  //   "4+Years".tr(),
  // ];
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
              AppBarBottomSheet(title: 'Your Offer'.tr()),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'Offer'.tr(),
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
                          'Currency'.tr(),
                          size: 13.sp,
                          color: AppCustomColors.appGreyLight,
                          pv: 10,
                        ),
                        SizedBox(
                          height: 40.h,
                          child: CustomDropDown(
                            hint: 'Select Currency'.tr(),
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
                        ),
                      ],
                    ).paddingOnly(top: 4.h, bottom: 12.h),
                  ),
                ],
              ).paddingOnly(top: 12.h, bottom: 12.h),
              AppText(
                'Date of Birth'.tr(),
              ),
              GestureDetector(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    _dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
                child: AbsorbPointer(
                  child: EditText(
                    hint: 'Select option',
                    controller: _dateController,
                    // prefixImage: AppImagePath.locationPin,
                    suffixWidget: Image.asset(AppImagePath.calender,),
                    // validateFunc: _validateEmail,
                  ),
                ),
              ).paddingOnly(bottom: 24.h),

              TapEffect(
                onClick: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => EditOfferBottomSheet(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppCustomColors.colorLightBlue5
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImagePath.editImg, height: 24.h, width: 24.w,),
                      AppText('Edit Offer', size: 17.sp, fontWeight: FontWeight.w700)
                    ],
                  )
                ),
              ),
            ],
          ).paddingAll(20.r),
        ),
      ),
    );
  }
}

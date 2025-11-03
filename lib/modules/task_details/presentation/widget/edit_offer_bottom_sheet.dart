import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/text_required.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';


class EditOfferBottomSheet extends StatefulWidget {
  const EditOfferBottomSheet({super.key});

  @override
  State<EditOfferBottomSheet> createState() => _EditOfferBottomSheetState();
}

class _EditOfferBottomSheetState extends State<EditOfferBottomSheet> {
  String selected = "all".tr();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
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
              ).paddingOnly(bottom: 12.h),

              AppText(
                'Note'.tr(),
              ),
              EditText(
                hint: "Write your note here...",
                minLines: 3,
                maxLines: 3,
                lines: 1,
                controller: _noteController,
              ).paddingOnly(bottom: 24.h),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppButton(
                      onTap: () {
                        AppNavigation.goBack();
                      },
                      title: 'Cancel'.tr(),
                      height: 48.h,
                      color: AppCustomColors.colorLightBlue5,
                      textColor: AppCustomColors.appTextColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                      borderColor: Colors.transparent,
                    ),
                  ),
                  8.widthBox,

                  Expanded(
                    flex: 3,
                    child: AppButton(
                      onTap: () {
                        AppNavigation.goBack();
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
                                AppText('Offer Updated Successfully!', size: 17.sp, fontWeight: FontWeight.w700,),
                                AppText('Great job! Your offer has been updated successfully and is now in your tasks pending list.',
                                  size: 17.sp, color: AppCustomColors.colorGrey80,),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 20, vertical: 208);
                        });
                      },
                      title: 'Update'.tr(),
                      height: 48.h,
                      color: AppCustomColors.appPrimaryColor,
                      textColor: AppCustomColors.appTextColor,
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

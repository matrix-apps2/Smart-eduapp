import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/component/animation/tap_effect.dart';
import 'package:smart_operation/modules/task_details/presentation/widget/your_offer_bottom_sheet.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/text_required.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';
import 'edit_offer_bottom_sheet.dart';


class WithdrawBottomSheet extends StatefulWidget {
  const WithdrawBottomSheet({super.key});

  @override
  State<WithdrawBottomSheet> createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<WithdrawBottomSheet> {

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
              AppBarBottomSheet(title: 'Withdraw Offer'.tr()),
              Image.asset(AppImagePath.withdrawImg).paddingOnly(bottom: 24, top: 24).toCenter(),
              // AppText('Offer Updated Successfully!', size: 17.sp, fontWeight: FontWeight.w700,),
              AppText('Are you sure you want to withdraw this offer? This action can\'t be undone and will permanently remove it from your tasks pending list.',
                size: 17.sp, color: AppCustomColors.colorGrey80,).paddingOnly(bottom: 24),
              Row(
                children: [
                  Expanded(
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
                                AppText('Offer Withdrawn Successfully!', size: 17.sp, fontWeight: FontWeight.w700,),
                                AppText('Your offer has been successfully withdrawn and is no longer listed as pending in your tasks.',
                                  size: 17.sp, color: AppCustomColors.colorGrey80,),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 20, vertical: 208);
                        });
                      },
                      title: 'Yes, Withdraw'.tr(),
                      height: 48.h,
                      color: AppCustomColors.redColor.withOpacity(.05),
                      textColor: AppCustomColors.redColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                      borderColor: Colors.transparent,
                    ),
                  ),

                  8.widthBox,
                  Expanded(
                    child: AppButton(
                      onTap: () => AppNavigation.goBack(),
                      title: 'Keep It'.tr(),
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

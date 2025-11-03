import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
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


class ExuseBottomSheet extends StatefulWidget {
  const ExuseBottomSheet({super.key, this.isForNewTasks = false});
  final bool isForNewTasks;

  @override
  State<ExuseBottomSheet> createState() => _ExuseBottomSheetState();
}

class _ExuseBottomSheetState extends State<ExuseBottomSheet> {
   TextEditingController reasonController = TextEditingController();

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
              AppBarBottomSheet(title: 'Excuse'.tr()),
              AppText(
                'Excuse Reason'.tr(),
              ),
              EditText(
                hint: "Write your reason here...",
                minLines: 3,
                maxLines: 3,
                lines: 1,
                controller: reasonController,
              ).paddingOnly(bottom: 24.h),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppButton(
                      onTap: (){AppNavigation.goBack();},
                      title: 'cancel'.tr(),
                      height: 48.h,
                      color: AppCustomColors.colorLightBlue5,
                      borderColor: AppCustomColors.colorLightBlue5,
                      textColor: AppCustomColors.blackColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                    ),
                  ),
                  8.widthBox,
                  Expanded(
                    flex: 2,
                    child: AppButton(
                      onTap: (){
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
                                AppText('Task Excused Successfully!', size: 17.sp, fontWeight: FontWeight.w700,),
                                AppText('Task has been excused successfully.',
                                  size: 17.sp, color: AppCustomColors.colorGrey80,),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 20, vertical: 208);
                        });
                      },
                      title: 'Excuse'.tr(),
                      height: 48.h,
                      color: AppCustomColors.redColor.withOpacity(.05),
                      textColor: AppCustomColors.redColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                      enabled: reasonController.text.isNotEmpty,
                      borderColor: Colors.transparent,
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

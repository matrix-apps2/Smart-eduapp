import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/widgets/text_required.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';
import '../../../my_tasks/presentation/widgets/filter.dart';
import '../../data/model/task_details_model.dart';
import '../widget/exuse_bottom_sheet.dart';
import '../widget/submint_offer_bottom_sheet.dart';
import '../widget/task_details_card.dart';
import '../widget/withdraw_bottom_sheet.dart';
import '../widget/your_offer_bottom_sheet.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final dummyTask = TaskDetailsModel(
    id: '#817001',
    title: 'Task Title Goes Here',
    description:
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    specialty: 'General Medical Tasks',
    language: 'Arabic',
    createdDate: '25 Mar, 2023 11:00 AM',
    deadline: '25 Mar, 2023 11:00 AM',
    countdown: '1d 21h 28m 52s',
    price: 100.00,
    status: 'Approved',
    files: [
      TaskFileModel(
        name: 'File Name Goes Here.pdf',
        description: 'File Description Goes Here',
        extension: 'pdf',
      ),
      TaskFileModel(
        name: 'File Name Goes Here.doc',
        description: 'File Description Goes Here',
        extension: 'doc',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Task Details',
        onBackPress: ()=> AppNavigation.goBack(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskDetailsCard(task: dummyTask),
            27.heightBox,
            if(dummyTask.status == 'Pending')
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => WithdrawBottomSheet(),
                    ),
                    title: 'Withdraw Offer'.tr(),
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
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => OfferBottomSheet(),
                    ),
                    title: 'View Your Offer'.tr(),
                    height: 48.h,
                    color: AppCustomColors.appPrimaryColor,
                    textColor: AppCustomColors.blackColor,
                    fontWeight: FontWeight.w700,
                    isRounded: false,
                  ),
                ),
        
              ],
            ),

            if(dummyTask.status == 'Waiting Offer' || dummyTask.status == 'Approved')
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppButton(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => ExuseBottomSheet(),
                      ),
                      title: 'Excuse'.tr(),
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
                    flex: 2,
                    child: AppButton(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SubmintOfferBottomSheet(),
                      ),
                      title: 'Submit an Offer'.tr(),
                      height: 48.h,
                      color: AppCustomColors.appPrimaryColor,
                      textColor: AppCustomColors.blackColor,
                      fontWeight: FontWeight.w700,
                      isRounded: false,
                    ),
                  ),

                ],
              ),

            if(dummyTask.status == 'Assigned')
              Column(
                children: [
                  AppText('Task has been assigned to you, Please click proceed to start working on the task.',
                  color: AppCustomColors.appPrimaryColor, pv: 0,).paddingSymmetric(vertical: 10),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onTap: () => showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => OfferBottomSheet(),
                          ),
                          title: 'Proceed'.tr(),
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
              ),

            if(dummyTask.status == 'On Going')...[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.black87.withOpacity(.06),
                    width: 1.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('Attachment', size: 15.sp).paddingOnly(bottom: 8),
                    TextRequired(text: 'Attach Files', text2: '*').paddingOnly(bottom: 8),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppCustomColors.blueColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppText(
                              'Upload Files',
                              size: 15.sp,
                              align: TextAlign.start,
                            ),
                          ),
                          Image.asset(AppImagePath.download),
                        ],
                      ),
                    ),
                    if (dummyTask.files.isEmpty)...[
                    Image.asset(AppImagePath.noFilesImg).toCenter(),
                    AppText('No Files Yet!', size: 17.sp, fontWeight: FontWeight.w700,).toCenter(),
                    AppText('Your files will appear here, please attachment task\'s files.', size: 17.sp, color: AppCustomColors.colorGrey80,).toCenter(),]
                  ],
                ),
              ).paddingOnly(bottom: 24),

              if (dummyTask.files.isNotEmpty)
              Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: Colors.black87.withOpacity(.06),
                  width: 1.w,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText('Attach Files', size: 15.sp).paddingOnly(bottom: 8),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppCustomColors.colorLightGreen5,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AppText(
                                  'File  Name',
                                  size: 15.sp,
                                  align: TextAlign.start,
                                ),
                              ),
                              SvgPicture.asset(AppIcons.delete),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.widthBox,
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        AppText('File Description', size: 15.sp).paddingOnly(bottom: 8),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppCustomColors.colorGrey5,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AppText(
                                  'Task File',
                                  size: 15.sp,
                                  align: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).paddingOnly(bottom: 24),
              Row(
              children: [
                Expanded(
                  child: AppButton(
                    onTap: () {},
                    title: 'Done'.tr(),
                    height: 48.h,
                    color: AppCustomColors.appPrimaryColor,
                    textColor: AppCustomColors.blackColor,
                    fontWeight: FontWeight.w700,
                    isRounded: false,
                    borderColor: Colors.transparent,
                    enabled: false,
                  ),
                ),
              ],
            ),
            ],
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

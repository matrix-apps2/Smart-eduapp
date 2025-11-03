import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../data/model/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({super.key, required this.task});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigation.toNamed(Routes.taskDetailsScreen);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide( color: Colors.black87.withOpacity(.06), width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(task.id,
                    size: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppCustomColors.colorLightBlue5,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: AppText(
                          '\$${task.price.toStringAsFixed(2)}',
                          fontWeight: FontWeight.w700,
                          size: 11.sp,
                        ),
                      ),
                      8.widthBox,
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: task.statusColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: AppText(
                          task.status,
                          color: task.statusColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              8.heightBox,
              AppText(task.title,
                size: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppCustomColors.appPrimaryColor,
                pv: 0, ph: 0,
              ),

              6.heightBox,
              AppText(
                task.description,
                size: 13.sp,
                color: AppCustomColors.colorGrey80,
                align: TextAlign.start,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  AppText('Deadline:',
                    size: 13.sp, ph: 0, pv: 0,
                    color: AppCustomColors.colorGrey80,
                    align: TextAlign.start,),
                  Spacer(),
                  AppText(task.deadline, size: 13.sp, fontWeight: FontWeight.w700, ph: 0, pv: 0,),
                ],
              ),
              if (task.countdown.isNotEmpty) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    AppText('Countdown:',
                      size: 13.sp, ph: 0, pv: 0,
                      color: AppCustomColors.colorGrey80,
                      align: TextAlign.start,),
                    Spacer(),
                    AppText(task.countdown, ph: 0, pv: 0,
                      size: 13.sp, fontWeight: FontWeight.w700, color: Colors.red,),
                  ],
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  Chip(
                      color: WidgetStateProperty.all(AppCustomColors.colorGrey5),
                      label: AppText(task.category, ph: 0, pv: 0,)),
                  const SizedBox(width: 8),
                  Chip(
                      color: WidgetStateProperty.all(AppCustomColors.colorGrey5),
                      label: AppText(task.language, ph: 0, pv: 0,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
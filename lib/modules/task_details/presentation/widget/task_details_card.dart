import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/modules/task_details/presentation/widget/comments_bottom_sheet.dart';
import 'package:smart_operation/modules/task_details/presentation/widget/reviews_bottom_sheet.dart';
import 'package:smart_operation/modules/task_details/presentation/widget/your_offer_bottom_sheet.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../data/model/task_details_model.dart';

class TaskDetailsCard extends StatelessWidget {
  final TaskDetailsModel task;
  const TaskDetailsCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.black87.withOpacity(.06),
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row — ID, Price, Status
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
              align: TextAlign.start, pv: 0,
            ),

            16.heightBox,

            Divider(color: Colors.grey.withOpacity(0.2)),
            16.heightBox,

            // Details rows
            _buildDetailRow('Specialty:', task.specialty),
            _buildDetailRow('Language:', task.language),
            _buildDetailRow('Created Date:', task.createdDate),
            _buildDetailRow('Deadline:', task.deadline),
            _buildDetailRow(
              'Countdown:',
              task.countdown,
              valueColor: Colors.redAccent,
            ),
            16.heightBox,
            Divider(color: Colors.grey.withOpacity(0.2)),

            16.heightBox,
            AppText('Files',
              size: 15.sp, pv: 0, fontWeight: FontWeight.w700,),

            4.heightBox,
            for (var file in task.files) _buildFileItem(file),
            16.heightBox,
            Divider(color: Colors.grey.withOpacity(0.2)),
            16.heightBox,
            // Reviews & Comments buttons
            Column(
              children: [
                _buildBottomButton(
                  label: 'Reviews',
                  onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .65
                    ),
                    context: context,
                    builder: (context) => ReviewsBottomSheet(),
                  ),
                ),
                16.heightBox,
                Divider(color: Colors.grey.withOpacity(0.2)),
                16.heightBox,
                _buildBottomButton(
                  label: 'Comments',
                  onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .80
                    ),
                    context: context,
                    builder: (context) => CommentsBottomSheet(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            label,
            color: AppCustomColors.colorGrey80,
            size: 13.sp, pv: 0,
          ),
          AppText(
            value,
            color: valueColor?? AppCustomColors.appTextColor,
            fontWeight: FontWeight.w700,
            size: 13.sp, pv: 0,
          ),
        ],
      ),
    );
  }

  Widget _buildFileItem(TaskFileModel file) {
    String icon;

    switch (file.extension) {
      case 'pdf':
        icon = AppIcons.pdfIcon;
        break;
      case 'doc':
      case 'docx':
        icon = AppIcons.docIcon;
        break;
      default:
        icon = AppIcons.pdfIcon;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(file.description.isNotEmpty)
        AppText(file.description,
        align: TextAlign.start, color: AppCustomColors.colorGrey80,),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppCustomColors.colorLightGreen5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon, width: 20.w, height: 20.w,),
              const SizedBox(width: 10),
              Expanded(
                child: AppText(
                  file.name,
                  size: 15.sp,
                  align: TextAlign.start,
                ),
              ),
              Image.asset(AppImagePath.download),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AppText(
            label,
            size: 13.sp, pv: 0,
          ),
          Spacer(),
          AppText(
            'View $label',
            size: 13.sp, pv: 0,
          ),
          Icon(Icons.arrow_forward_rounded, size: 16.sp),
        ],
      ),
    );
  }
}

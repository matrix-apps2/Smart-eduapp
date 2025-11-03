import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/modules/calender/peresentation/widgets/calender_bottom_sheet.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../utils/theme/appImages.dart';
import '../../../my_tasks/data/model/task_model.dart';
import '../../../my_tasks/presentation/widgets/task_card.dart';
import '../widgets/horezontal_calender.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  TextEditingController searchController = TextEditingController();
  List<TaskModel> dummyTasks = [
    TaskModel(
      id: '#817001',
      title: 'Task Title Goes Here',
      description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      deadline: '25 Mar, 2023 11:00 AM',
      category: 'General Medical Tasks',
      language: 'Arabic',
      status: 'Pending',
      price: 100.0,
      countdown: '',
    ),
    TaskModel(
      id: '#817002',
      title: 'Task Title Goes Here',
      description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      deadline: '25 Mar, 2023 11:00 AM',
      category: 'General Medical Tasks',
      language: 'Arabic',
      status: 'Assigned',
      price: 100.0,
      countdown: '1d 21h 28m 52s',
    ),
    TaskModel(
      id: '#817003',
      title: 'Task Title Goes Here',
      description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      deadline: '25 Mar, 2023 11:00 AM',
      category: 'General Medical Tasks',
      language: 'Arabic',
      status: 'On Going',
      price: 100.0,
      countdown: '1d 21h 28m 52s',
    ),
    TaskModel(
      id: '#817004',
      title: 'Task Title Goes Here',
      description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      deadline: '25 Mar, 2023 11:00 AM',
      category: 'General Medical Tasks',
      language: 'Arabic',
      status: 'In Review',
      price: 100.0,
      countdown: '1d 21h 28m 52s',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: SafeArea(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: AppText('Calender', size: 15.sp, fontWeight: FontWeight.w700,).toCenter(),
            actions: [
              IconButton(
                icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8.r,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(AppIcons.calenderDisplay)
                ),
                onPressed: () => calenderBottomSheet(context, (onCalenderSelected){}, 'week'),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: HorizontalCalendar()),
          12.heightBox,
          AppText('Today’s Tasks', size: 13.sp, fontWeight: FontWeight.w700,).paddingSymmetric(horizontal: 20),
          8.heightBox,
          if (dummyTasks.isEmpty)...[
            Image.asset(AppImagePath.todayTasksEmpty).toCenter(),
            AppText('No Tasks Due Today!', size: 17.sp, fontWeight: FontWeight.w700,).toCenter(),
            AppText('Enjoy a clear schedule. You have no deadlines to meet today.', size: 17.sp, color: AppCustomColors.colorGrey80,).paddingSymmetric(horizontal: 20),
          ],
            
          if (dummyTasks.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: dummyTasks.length,
              itemBuilder: (context, index) {
                return TaskCard(task: dummyTasks[index]);
              },
            ).paddingSymmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}



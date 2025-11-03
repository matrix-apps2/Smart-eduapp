import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/app_colors.dart';

import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../../my_tasks/data/model/task_model.dart';
import '../../my_tasks/presentation/widgets/filter.dart';
import '../../my_tasks/presentation/widgets/task_card.dart';


class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
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
            title: AppText('New Tasks', size: 15.sp, fontWeight: FontWeight.w700,).toCenter(),
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
                    child: Icon(Icons.filter_list)
                ),
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Filter(isForNewTasks: true),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(dummyTasks.isEmpty)...[
            Image.asset(AppImagePath.taskEmpty),
            AppText('No Tasks Yet!', size: 17.sp, fontWeight: FontWeight.w700,),
            AppText('New tasks will appear here, please come back later.', size: 17.sp, color: AppCustomColors.colorGrey80,),
          ],
          if(dummyTasks.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: dummyTasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(task: dummyTasks[index]);
                },
              ),
            ),
        ],
      ).paddingSymmetric(horizontal: dummyTasks.isNotEmpty? 20 : 44),
    );
  }
}



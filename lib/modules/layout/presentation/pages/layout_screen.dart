
import 'package:smart_operation/modules/my_tasks/presentation/pages/my_tasks_screen.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/working_on_page.dart';
import '../../../../modules/contact_us/presentation/contact_us_screen.dart';
import '../../../../modules/home/presentation/pages/home_screen.dart';
import '../../../../modules/layout/layout/layout_cubit.dart';
import '../../../../modules/layout/presentation/widgets/bottom_nav_bar.dart';
import '../../../../modules/more/more_screen.dart';
import '../../../../modules/profile/presentation/pages/profile_screen.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../calender/peresentation/pages/calender_screen.dart';
import '../../../my_status/presentation/pages/my_status_screen.dart';
import '../../../new_tasks/pages/new_tasks_screen.dart';
import '../../../support/presentation/support_screen.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key, required int? currentPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const LayoutView();
  }
}

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(builder: (subContext, state) {
      if (state.state == BaseState.loading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state.state == BaseState.error) {
        return Scaffold(
          body: ErrorView(
            onRetry: () {},
            logout: true,
            errorModel: state.error,
          ),
        );
      }

      int currentIndex = state.bottomNavIndex;
      int onBackPressedTime = 0;

      return WillPopScope(
        onWillPop: () async {
          if (currentIndex != 0) {
            context.read<LayoutCubit>().setCurrentIndex(0);
            return false;
          } else {
            DateTime now = DateTime.now();
            if (now.millisecondsSinceEpoch - onBackPressedTime > 3000) {
              onBackPressedTime = now.millisecondsSinceEpoch;
              AppSnackbar.show(
                  context: AppNavigation.navigationKey.currentContext!,
                  message: Strings().pressAgainToExit,
                  title: '');
              return false;
            } else {
              return true;
            }
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                AppColor.clr(AppColor.scaffoldBackgroundColor),
                bottomNavigationBar: ConvexAppBar(
                  items: [
                    TabItem(icon: state.bottomNavIndex == 0? Image.asset(AppImagePath.myStatus)
                        : Image.asset(AppImagePath.myStatusDis), title: 'My Status'),
                    TabItem(icon: state.bottomNavIndex == 1? Image.asset(AppImagePath.myTasks)
                        : Image.asset(AppImagePath.myTasksDis), title: 'My Tasks'),
                    TabItem(icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppCustomColors.appPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppCustomColors.appPrimaryColor.withOpacity(0.5), // نفس اللون مع شفافية
                            blurRadius: 8.0, // نصف قطر التمويه
                            spreadRadius: 2.0, // نصف قطر الانتشار
                            offset: const Offset(0, 4), // إزاحة الظل
                          ),
                        ],
                      ),
                      child: Image.asset(AppImagePath.newTasks),
                    ), title: ''),
                    TabItem(icon: state.bottomNavIndex == 3? Image.asset(AppImagePath.btmNavCalender)
                        : Image.asset(AppImagePath.btmNavCalenderDis), title: 'Calender'),
                    TabItem(icon: state.bottomNavIndex == 4? Image.asset(AppImagePath.btmNavProfile)
                        : Image.asset(AppImagePath.btmNavProfileDis), title: 'Profile'),
                  ],
                  initialActiveIndex: currentIndex,
                  onTap: (index) {
                    context.read<LayoutCubit>().setCurrentIndex(index);
                  },
                  style: TabStyle.fixedCircle, // أو أي ستايل تفضله
                  backgroundColor: Colors.white, // لون الخلفية
                  color: Colors.black, // لون الأيقونات غير النشطة
                  activeColor: Colors.blue, // لون الأيقونة النشطة
                  height: 60.h,
                  elevation: 1,
                  top: -20, // للتحدب
                ),
                body: WillPopScope(
                  child: IndexedStack(
                    index: currentIndex,
                    children: const [
                      MyStatusScreen(),
                      MyTasksScreen(),
                      NewTasksScreen(),
                      CalenderScreen(),
                      // CalenderScreen(),
                    ],
                  ),
                  onWillPop: () async {
                    if (currentIndex != 0) {
                      context.read<LayoutCubit>().setCurrentIndex(0);
                      return false;
                    } else {
                      return true;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

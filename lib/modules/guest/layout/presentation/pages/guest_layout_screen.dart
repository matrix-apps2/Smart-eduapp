
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_operation/modules/guest/home/pages/guest_home_screen.dart';
import 'package:smart_operation/modules/guest/layout/layout_cubit/guest_layout_cubit.dart';
import 'package:smart_operation/modules/my_tasks/presentation/pages/my_tasks_screen.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../../../../core/base/base_states.dart';
import '../../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../../utils/routes/navigation_services.dart';
import '../../../../../utils/theme/app_colors.dart';
import '../../../../../utils/translations/strings.dart';
import '../../../../../widgets/app_snackbar.dart';
import '../../../portoflio/pages/portfolio_screen.dart';
import '../../../services/pages/services_screen.dart';

class GuestLayoutScreen extends StatelessWidget {
  const GuestLayoutScreen({super.key, required int? currentPage});
  @override
  Widget build(BuildContext context) {
    return const LayoutView();
  }
}

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

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
    return BlocBuilder<GuestLayoutCubit, GuestLayoutState>(builder: (subContext, state) {
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
            context.read<GuestLayoutCubit>().setCurrentIndex(0);
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
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<GuestLayoutCubit>().setCurrentIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              selectedLabelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
              unselectedLabelStyle: TextStyle(fontSize: 13.sp),
              items: [
                BottomNavigationBarItem(
                  icon: state.bottomNavIndex == 0 ? SvgPicture.asset(AppIcons.navHomeAct, height: 24.h, width: 24.h,) : SvgPicture.asset(AppIcons.navHome, height: 24.h, width: 24.h,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: state.bottomNavIndex == 1 ? SvgPicture.asset(AppIcons.navServicesAct,height: 24.h, width: 24.h,) : SvgPicture.asset(AppIcons.navServices,height: 24.h, width: 24.h,),
                  label: 'Services',
                ),
                BottomNavigationBarItem(
                  icon: state.bottomNavIndex == 2 ? SvgPicture.asset(AppIcons.navPortfolioAct,height: 24.h, width: 24.h,) : SvgPicture.asset(AppIcons.navPortfolio,height: 24.h, width: 24.h,),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: state.bottomNavIndex == 3 ? SvgPicture.asset(AppIcons.navBlogsAct,height: 24.h, width: 24.h,) : SvgPicture.asset(AppIcons.navBlogs,height: 24.h, width: 24.h,),
                  label: 'Blogs',
                ),
                BottomNavigationBarItem(
                  icon: state.bottomNavIndex == 4 ? SvgPicture.asset(AppIcons.navMoreAct,height: 24.h, width: 24.h,) : SvgPicture.asset(AppIcons.navMore,height: 24.h, width: 24.h,),
                  label: 'More',
                ),
              ],
            ),
          ),
                body: WillPopScope(
                  child: IndexedStack(
                    index: currentIndex,
                    children: [
                      GuestHomeScreen(),
                      ServicesScreen(),
                      PortfolioScreen(),
                    ],
                  ),
                  onWillPop: () async {
                    if (currentIndex != 0) {
                      context.read<GuestLayoutCubit>().setCurrentIndex(0);
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

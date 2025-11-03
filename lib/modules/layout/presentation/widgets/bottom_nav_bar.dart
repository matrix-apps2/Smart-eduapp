

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/layout/layout/layout_cubit.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtomNavBar extends StatelessWidget {
  const AppButtomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        List<Widget> children =
            initBottomSheetChildren(context, state.bottomNavIndex);
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ...children,
            ],
          ),
        );
      },
    );
  }

  Widget singleButton({
    required String name,
    required String icon,
    required Function() onPressed,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => onPressed(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 6),
          Image.asset(
            icon,
            width: 26.h,
            height: 26.h,
            color: isSelected
                ? AppCustomColors.appPrimaryColor
                : Colors.grey,
          ),
          AppText(name , color: isSelected
              ? AppCustomColors.appPrimaryColor
              : Colors.grey,).footer(),
        ],
      ),
    );
  }

  List<Widget> initBottomSheetChildren(BuildContext context, int currentIndex) {
    List<Widget> children = [];
    children.add(singleButton(
      name: "الرئيسية",
      icon: AppImagePath.house,
      isSelected: currentIndex == 0,
      onPressed: () {
        FocusScope.of(context).unfocus();
        context.read<LayoutCubit>().setCurrentIndex(0);
      },
    ));
    children.add(
      singleButton(
        name: "الطلبات",
        icon: AppImagePath.orders,
        isSelected: currentIndex == 1,
        onPressed: () {
          FocusScope.of(context).unfocus();
          context.read<LayoutCubit>().setCurrentIndex(1);
        },
      ),
    );
    children.add(
      singleButton(
        name: "الدعم الفني",
        icon: AppImagePath.support,
        isSelected: currentIndex == 2,
        onPressed: () {
          FocusScope.of(context).unfocus();
          context.read<LayoutCubit>().setCurrentIndex(2);
        },
      ),
    );
    children.add(
      singleButton(
        name: "حسابي",
        icon: AppImagePath.profileIcon,
        isSelected: currentIndex == 3,
        onPressed: () {
          FocusScope.of(context).unfocus();
          context.read<LayoutCubit>().setCurrentIndex(3);
        },
      ),
    );


    return children;
  }
}

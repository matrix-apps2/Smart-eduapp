import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';

// ignore: must_be_immutable
class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cahts'.tr(),
      ),
      body: Column(
        children: [
          // ===== Search Bar =====
          SizedBox(
            height: 44.h,
            child: EditText(
              hint: '${'search'.tr()}...',
              controller: searchController,
              lines: 1,
              textFieldColor: const Color(0xffF7F7F8),
              prefixImage: AppImagePath.searchIcon,
            ),
          )
              .animate()
              .fadeIn(duration: 250.ms)
              .slide(begin: const Offset(0, -0.1), end: Offset.zero, curve: Curves.easeOutCubic),

          8.heightBox,

          // ===== Conversations List =====
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    AppNavigation.toNamed(Routes.addChatView);
                  },
                  child: Container(
                    height: 70.h,
                    padding: EdgeInsets.all(4.r),
                    color: Theme.of(context).cardColor,
                    child: Row(
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://i.pravatar.cc/150?img=3'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'ستار بكس',
                                size: 13.sp,
                                color: Theme.of(context).textTheme.bodyMedium!.color!,
                              ),
                              AppText(
                                'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                                maxLines: 1,
                                size: 13.sp,
                                color: Theme.of(context).textTheme.bodySmall!.color!,
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 4.w),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              'PM 2:21',
                              size: 13.sp,
                              color: Theme.of(context).textTheme.bodySmall!.color!,
                            ),
                            Container(
                              height: 25.h,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 8.5.w),
                              decoration: BoxDecoration(
                                color: AppCustomColors.appPrimaryColor,
                                // borderRadius: BorderRadius.circular(24.r),
                                shape: BoxShape.circle
                              ),
                              child: AppText(
                                '2',
                                size: 13.sp,
                                color: AppCustomColors.appWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      .paddingOnly(bottom: 8.h)
                      .animate(delay: (100 * index).ms) // delay لكل عنصر
                      .fadeIn(duration: 200.ms)
                      .slide(
                    begin: const Offset(0.15, 0), // Slide من اليمين
                    end: Offset.zero,
                    duration: 200.ms,
                    curve: Curves.easeOutCubic,
                  ),
                );
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 19.w, vertical: 8.h),
    );
  }
}

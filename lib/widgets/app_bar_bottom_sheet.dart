// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../core/presentation/widgets/app_text.dart';
import '../utils/routes/navigation_services.dart';
import '../utils/theme/appColors.dart';
import '../utils/theme/appImages.dart';

class AppBarBottomSheet extends StatelessWidget {
  final String title;
  final bool showIconBack;
  const AppBarBottomSheet({
    Key? key,
    required this.title,
    this.showIconBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showIconBack
              ? GestureDetector(
                  onTap: () => AppNavigation.goBack(),
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppCustomColors.appWhiteColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SvgPicture.asset(AppIcons.close, colorFilter: ColorFilter.mode(Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn),),
                  ),
                )
              : SizedBox(
                  width: 40.w,
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 4.h,
                width: 72.w,
                decoration: BoxDecoration(
                  color: AppCustomColors.appPrimaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              AppText(
                title,
                size: 14.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.bodyMedium!.color!,
              ),
            ],
          ),
          40.widthBox,
        ],
      ),
    );
  }
}

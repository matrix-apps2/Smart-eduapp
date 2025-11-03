import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImagePath.notificationEmpty),
          32.heightBox,
          AppText('No Notifications Yet', size: 17.sp, fontWeight: FontWeight.w700,),
          10.heightBox,
          AppText('You do not have Notifications yet, please come back later.', size: 17.sp, fontWeight: FontWeight.w400, color: Colors.black87,),
        ],
      ).paddingSymmetric(horizontal: 40),
    );
  }
}
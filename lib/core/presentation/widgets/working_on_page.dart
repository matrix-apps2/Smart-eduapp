import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import 'app_text.dart';

class WorkingOnPage extends StatelessWidget {
  const WorkingOnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText("Working On It ...",fontWeight: FontWeight.bold,size: 25.sp,),
            20.heightBox,
            // AppButton(onTap: ()=> AppNavigation.toNamedOffAll(Routes.loginRegisterScreen),title: "Go Back",isOutlined: true, ).paddingSymmetric(horizontal: 50.w)
          ],
        ),
      ) ,
    ) ;
  }
}

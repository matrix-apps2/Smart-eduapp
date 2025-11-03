import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

class SuccessfulScreen extends StatefulWidget {
  final bool isResetPassword;
  const SuccessfulScreen({super.key, this.isResetPassword = false});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(AppImagePath.successMark, height: 144.h, width: 144.w).toCenter(),
            52.heightBox,
            AppText(!widget.isResetPassword? 'Sign Up Successful' : 'New Password Confirmed!', size: 17.sp, fontWeight: FontWeight.w700,),
            8.heightBox,
            AppText(!widget.isResetPassword? 'You\'re all set!. You can now start browsing tasks that match your skills and submit your offers.'
              : 'You have successfully confirm your new password. please use it when logging in.',
              size: 15.sp,),
            Spacer(),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    AppCustomColors.colorLightBlue85,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: SizedBox(
                width: 48.w,
                height: 48.h,
                child: CircularProgressIndicator(
                  strokeWidth: 8.w,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              
                ),
              ).paddingAll(4),
            ),
            12.heightBox,
            AppText(!widget.isResetPassword?'You will be moved to home screen right now.'
                : 'You will be moved to home screen right now.', size: 13.sp,),
            AppText(!widget.isResetPassword? 'Enjoy the features!' : 'Enjoy the features!', size: 13.sp,),
            18.heightBox,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

class TextRequired extends StatelessWidget {
  TextRequired({
    super.key,
    this.text,
    this.text2,
  });
  String? text;
  String? text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: AppCustomColors.appGreyLight,
          // fontFamily: 'careem',
        ),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

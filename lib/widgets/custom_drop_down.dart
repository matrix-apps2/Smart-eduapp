import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/presentation/widgets/app_text.dart';
import '../modules/setting/presentation/cubit/setting_cubit.dart';
import '../utils/theme/appColors.dart';


class CustomDropDown extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final String hint;
  final Color? fillColor;
  final List<DropdownMenuItem<String>> items;
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.fillColor,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        focusColor: Colors.transparent,
      ),
      child: DropdownButtonFormField<String>(
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: fillColor ?? AppCustomColors.cardColor,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12.sp,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        hint: AppText(
          hint,
          size: 13.sp,
          ph: 8.w,
          color: AppCustomColors.hintColor,
        ),
        items: items,
        icon: Icon(
          Icons.keyboard_arrow_down_sharp,
        ),
        style: TextStyle(
          color: AppCustomColors.appTextColor,
          fontSize: 14.sp,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

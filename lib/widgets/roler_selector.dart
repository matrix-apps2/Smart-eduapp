import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/theme/appColors.dart';
import 'package:smart_operation/utils/theme/app_colors.dart';

class RoleSelector extends StatefulWidget {
  final Function(String) onRoleSelected;
  final String selectedRole;

  const RoleSelector({
    super.key,
    required this.onRoleSelected,
    required this.selectedRole,
  });

  @override
  State<RoleSelector> createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppCustomColors.blueColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          _buildOption("I’m a Freelancer"),
          Container(height: 20.h,
            width: 1.w,
            decoration: BoxDecoration(
              color: AppCustomColors.colorLightBlue10
            ),
          ).paddingSymmetric(horizontal: 4),
          _buildOption("I’m a Client"),
        ],
      ),
    );
  }

  Widget _buildOption(String label) {
    bool isSelected = widget.selectedRole == label;

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.onRoleSelected(label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50.h,
          decoration: BoxDecoration(
            color: isSelected ? AppCustomColors.appPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.black,
                fontWeight: isSelected? FontWeight.w700 : FontWeight.w400,
                fontSize: 15.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}

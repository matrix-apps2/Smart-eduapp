import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

class CustomCheckBoxGroup extends StatefulWidget {
  final List<String> options;
  final Function(List<String>) onChanged;

  const CustomCheckBoxGroup({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<CustomCheckBoxGroup> createState() => _CustomCheckBoxGroupState();
}

class _CustomCheckBoxGroupState extends State<CustomCheckBoxGroup> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      // runSpacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.options.map((option) {
        final isSelected = selectedValues.contains(option);
        return CustomCheckBoxWidget(
          label: option,
          isSelected: isSelected,
          onChanged: (value) {
            setState(() {
              if (value) {
                selectedValues.add(option);
              } else {
                selectedValues.remove(option);
              }
            });
            widget.onChanged(selectedValues);
          },
        );
      }).toList(),
    );
  }
}

class CustomCheckBoxWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const CustomCheckBoxWidget({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isSelected),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22.w,
            height: 22.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 1.25.w,
              ),
              color: isSelected ? AppCustomColors.appPrimaryColor : Colors.transparent,
            ),
            child: isSelected
                ? Icon(Icons.check_rounded, color: Colors.white, size: 12.sp)
                : null,
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

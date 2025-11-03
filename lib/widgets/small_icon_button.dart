import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallIconButton extends StatelessWidget {
  final String icon;
  final Function()? onTap;
  final Color borderColor;
  final Color? color;
  final double? width;
  final double? height;
  final Color? iconColor;
  const SmallIconButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.borderColor = Colors.transparent,
    this.color,
    this.width,
    this.height,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: width ?? 40.w,
        height: height ?? 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Color(0xff2E2E340A).withOpacity(0.04),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: borderColor,
            ),),
        child: SvgPicture.asset(
          icon,
          colorFilter: iconColor != null
              ? ColorFilter.mode(
                  iconColor!,
                  BlendMode.srcIn,
                )
              : null,
        ),
      ),
    );
  }
}

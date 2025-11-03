import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/theme/appImages.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final bool isBackButtonExist;
  final VoidCallback? onBackPress;
  final Widget? leading;
  final double? height;
  final double? leadingWidth;
  final Color? color;
  final List<Widget>? actions;
  final bool isCenterTitle;
  final Widget? appbar;
  final Widget? rightIcon; // 👈 أضفنا الخاصية الجديدة هنا

  const CustomAppBar({
    Key? key,
    this.title,
    this.titleColor,
    this.isBackButtonExist = true,
    this.isCenterTitle = true,
    this.leading,
    this.height,
    this.leadingWidth,
    this.color,
    this.actions,
    this.appbar,
    this.onBackPress,
    this.rightIcon, // 👈 هنا كمان
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(((height ?? 60)).h),
      child: appbar ??
          AppBar(
            backgroundColor: color ?? Colors.transparent,
            elevation: 0,
            title: (title != null
                ? AppText(
              title ?? '',
              color: titleColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ).header()
                : const SizedBox.shrink()),
            centerTitle: isCenterTitle,
            leading: leading ??
                (isBackButtonExist
                    ? GestureDetector(
                  onTap: onBackPress ?? () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 32,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      context.locale.languageCode != 'ar'
                          ? AppIcons.arrow
                          : AppIcons.rightArrow,
                      colorFilter: const ColorFilter.mode(
                          Colors.black, BlendMode.srcIn),
                    ),
                  ).paddingSymmetric(horizontal: 4, vertical: 4),
                )
                    : const SizedBox()),
            leadingWidth: isBackButtonExist ? null : leadingWidth ?? 0,

            // ✅ هنا أضفنا إمكانية الأيقونة اليمنى بجانب الـ actions لو وجدت
            actions: [
              if (rightIcon != null) rightIcon!,
              if (actions != null) ...actions!,
              8.widthBox, // padding بسيط
            ],
          ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, height ?? 60);
}

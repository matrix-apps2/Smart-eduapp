import '../core/presentation/widgets/app_text.dart';
import '../core/presentation/widgets/custom_loading_spinner.dart';
import '../utils/extensions/num_extensions.dart';
import '../utils/resources/resources.dart';
import 'package:flutter/material.dart';

import '../core/presentation/widgets/component/component.dart';
import '../utils/theme/appColors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? child;
  final String? title;
  final Widget? leadingWidget;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool isRounded;
  final bool isOutlined;
  final bool widerPadding;
  final bool loading;
  final bool enabled;
  final double? borderRadius;
  final FontWeight? fontWeight;

  const AppButton(
      {super.key,
        required this.onTap,
        this.leadingWidget,
        this.child,
        this.title,
        this.color,
        this.borderColor,
        this.borderWidth,
        this.textColor,
        this.width,
        this.fontSize,
        this.height,
        this.isRounded = true,
        this.isOutlined = false,
        this.widerPadding = false,
        this.loading = false,
        this.enabled = true,
        this.fontWeight,
        this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? deviceWidth,
      height: (height ?? 48),
      child: TapEffect(
        isClickable: !loading && enabled,
        onClick: loading ? () {} : onTap,
        child: Container(
          decoration: color != null
              ? null
              : BoxDecoration(
            color: AppCustomColors.appPrimaryColor,
            borderRadius: isRounded
                ? BorderRadius.circular(borderRadius ?? kRadius)
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  height: (height ?? 48).h,
                  color: !enabled
                      ? Colors.grey
                      : isOutlined
                      ? Colors.transparent
                      : (color ?? Colors.transparent),
                  highlightElevation: 0,
                  onPressed: loading ? () {} : onTap,
                  padding: !widerPadding
                      ? EdgeInsets.symmetric(horizontal: 8.w)
                      : EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
                  elevation: 0,
                  shape: isRounded
                      ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(
                        width: borderWidth??1.5.w,
                        color: borderColor ?? Colors.transparent),
                  )
                      : RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(borderRadius ?? kRadius),
                    side: BorderSide(
                        color:
                        borderColor ?? Theme.of(context).primaryColor,
                        width: borderWidth??1.5.w),
                  ),
                  child: loading
                      ? CustomLoadingSpinner(
                    size: (height ?? 20).h,
                    color: Theme.of(context).cardColor,
                  )
                      : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leadingWidget != null) ...[
                        leadingWidget!,
                        SizedBox(width: 6.w),
                      ],
                      _buttonChild(child),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonChild(Widget? child) {
    if (title != null) {
      return Center(
          child: AppText(
            title!,
            size: fontSize ?? 16,
            color: textColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.w700,
          ));
    }
    if (child != null) return child;
    return const SizedBox();
  }
}

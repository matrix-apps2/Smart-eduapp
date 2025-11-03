import '../core/presentation/widgets/app_text.dart';
import '../core/presentation/widgets/custom_loading_spinner.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Function? onTap;
  final String title;
  final bool loading;
  final bool enabled;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double? width;
  const AppElevatedButton({
    required this.title,
    required this.onTap,
    this.buttonStyle,
    this.loading = false,
    this.enabled = true,
    this.textStyle,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = AppText(title, style: textStyle);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: loading ? 50 : width,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onTap == null
            ? null
            : () {
                if (!loading && enabled) onTap!();
              },
        child: loading ? const CustomLoadingSpinner(size: 20) : child,
      ),
    );
  }

  copyWith({
    Function? onTap,
    String? title,
    bool? loading,
    ButtonStyle? buttonStyle,
    TextStyle? textStyle,
  }) {
    return AppElevatedButton(
      onTap: onTap ?? this.onTap,
      title: title ?? this.title,
      loading: loading ?? this.loading,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}

extension ElevationButtonExt on AppElevatedButton {
  AppElevatedButton noShadow() => copyWith(
        buttonStyle: buttonStyle?.copyWith(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ) ??
            ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
      );
  AppElevatedButton radius(double radius) => copyWith(
        buttonStyle: buttonStyle?.copyWith(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ) ??
            ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
      );

  AppElevatedButton color(Color color) => copyWith(
        buttonStyle: buttonStyle?.copyWith(
              backgroundColor: MaterialStateProperty.all(color),
              shadowColor: MaterialStateProperty.all(Colors.grey),
            ) ??
            ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              overlayColor: MaterialStateProperty.all(color.withOpacity(0.5)),
              shadowColor: MaterialStateProperty.all(Colors.grey),
              elevation: MaterialStateProperty.all(0),
            ),
      );
  AppElevatedButton textColor(Color color) => copyWith(
        textStyle: textStyle?.copyWith(color: color) ?? TextStyle(color: color),
      );

  AppElevatedButton border(Color color) => copyWith(
        buttonStyle: buttonStyle?.copyWith(
              side:
                  MaterialStateProperty.all(BorderSide(color: color, width: 1)),
            ) ??
            ButtonStyle(
              side:
                  MaterialStateProperty.all(BorderSide(color: color, width: 1)),
            ),
      );
}

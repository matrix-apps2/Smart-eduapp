import 'package:flutter/material.dart';

class AppTextTile extends StatelessWidget {
  final Widget title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final Function? onTap;
  final double? ph;
  final double? pv;
  const AppTextTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.trailing,
    this.leading,
    this.onTap,
    this.ph,
    this.pv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: ph ?? 0, vertical: pv ?? 0),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              SizedBox(width: 8),
            ],
            title,
            if (trailing != null) ...[
              SizedBox(width: 8),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

import '../core/presentation/widgets/app_text.dart';
import '../core/presentation/widgets/custom_loading_spinner.dart';
import '../utils/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppChip extends StatelessWidget {
  final String title;
  final double padding;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  const AppChip({
    required this.title,
    this.padding = 8,
    this.color,
    this.textColor,
    this.fontSize = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        label: AppText(title, color: textColor, pv: 0, ph: 2).footerExtra(),
        backgroundColor: color ?? Theme.of(context).chipTheme.backgroundColor,
        padding: EdgeInsets.all(padding),
        labelPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        side: const BorderSide(color: Colors.transparent, width: 1),
      ),
    );
  }
}

class AppChip2 extends StatelessWidget {
  final String title;
  final double padding;
  final double fontSize;
  final Color? textColor;
  final IconData icon;
  final Function()? onTap;
  final String? value;
  final Color? valueColor;
  final bool loading;
  const AppChip2({
    required this.title,
    required this.icon,
    this.padding = 8,
    this.fontSize = 12,
    this.textColor,
    this.value,
    this.valueColor,
    this.onTap,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color color = textColor ??
        Theme.of(context).textTheme.bodySmall?.color ??
        Colors.grey;
    if (value != null && value!.isNotEmpty) {
      color = valueColor ?? Theme.of(context).primaryColor;
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration().chip(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 14, color: color.withOpacity(0.8)),
            const SizedBox(width: 4),
            if (loading)
              const CustomLoadingSpinner(circleLoading: true, size: 20),
            if (!loading)
              Directionality(
                  textDirection: TextDirection.ltr, //To display Date properly
                  child: AppText(value ?? title, color: color, pv: 0, ph: 0)),
          ],
        ),
      ),
    );
  }
}

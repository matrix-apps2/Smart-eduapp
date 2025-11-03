import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final double height;
  final double? width;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.radius = 12,
    this.height = 48,
    this.width,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width??double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

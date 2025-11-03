import '../utils/routes/navigation_services.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final double padding;
  final Color color;
  final Function()? onTap;
  const AppBackButton({
    this.onTap,
    this.padding = 8,
    this.color = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => AppNavigation.goBack(),
      child: Container(
        padding: EdgeInsets.all(padding),
        color: Colors.transparent,
        margin: const EdgeInsets.all(8),
        child: Icon(Icons.arrow_back, color: color),
      ),
    );
  }
}

import '../../../../core/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  final String desc;
  const AboutView({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(desc, ph: 12),
        ],
      ),
    );
  }
}

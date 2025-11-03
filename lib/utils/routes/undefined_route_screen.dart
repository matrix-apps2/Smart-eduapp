import '../../core/presentation/widgets/app_text.dart';
import '../../utils/translations/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UndefinedRouteScreen extends StatelessWidget {
  final String path;
  const UndefinedRouteScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppText(Strings().noRouteFound).header(),
            if (kDebugMode) AppText(path).header(),
          ],
        ),
      ),
    );
  }
}

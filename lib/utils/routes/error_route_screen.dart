import '../../core/presentation/widgets/app_text.dart';
import '../../generated/assets.dart';
import '../../utils/resources/values_manager.dart';
import '../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorRouteScreen extends StatelessWidget {
  final String message;
  const ErrorRouteScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            Assets.assetsImagesServerError,
            fit: BoxFit.fill,
            width: deviceWidth / 1.6,
            repeat: true,
          ),
        ),
        AppText(message),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(Strings().back))
      ],
    ));
  }
}

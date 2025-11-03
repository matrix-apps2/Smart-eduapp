import 'dart:io';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../generated/assets.dart';
import '../../../../utils/constants/const.dart';
import '../../../../utils/resources/values_manager.dart';
import '../../../widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/translations/strings.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.assetsImagesLogo, width: 100, height: 100),
              const SizedBox(height: 18),
              AppText(Strings().newUpdateAvailableForce).header(),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  title: Strings().updateNow,
                  onTap: () {
                    Platform.isAndroid
                        ? launch(Const.playStoreUrl)
                        : launch(Const.appStoreUrl);
                  },
                )
                    .color(
                      Theme.of(context).colorScheme.secondary,
                    )
                    .textColor(Colors.white)
                    .radius(kRadius),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

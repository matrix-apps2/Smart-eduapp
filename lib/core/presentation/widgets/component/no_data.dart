import '../../../../generated/assets.dart';
import '../../../../utils/resources/resources.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataScreen extends StatelessWidget {
  final String? title;
  final String? desc;
  const NoDataScreen({Key? key, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingHorizontal),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset(
            Assets.assetsImagesGifEmptyList,
            width: 200,
            repeat: true,
          ),
          const SizedBox(height: kPaddingHorizontal),
          Text(
            title ?? Strings().noResultFound,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kPadding),
          Text(
            desc ?? '',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kPadding),
        ]),
      ),
    );
  }
}

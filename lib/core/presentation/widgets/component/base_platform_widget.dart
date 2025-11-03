import 'dart:io';

import 'package:flutter/material.dart';

abstract class BasePlatformWidget<A extends Widget, I extends Widget>
    extends StatelessWidget {
  const BasePlatformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? materialWidget(context)
        : cupertinoWidget(context);
  }

  A materialWidget(BuildContext context);

  I cupertinoWidget(BuildContext context);
}

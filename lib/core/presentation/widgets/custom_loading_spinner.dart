import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'component/base_platform_widget.dart';

class CustomLoadingSpinner extends BasePlatformWidget<Center, Center> {
  final Color? color;
  final double? size;
  final bool circleLoading;
  const CustomLoadingSpinner({
    Key? key,
    this.color,
    this.size,
    this.circleLoading = false,
  }) : super(key: key);
  @override
  Center cupertinoWidget(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: color ?? Theme.of(context).primaryColor,
        size: 35,
      ),
    );
  }

  @override
  Center materialWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (size ?? 24),
        width: (size ?? 24),
        child: circleLoading
            ? const CircularProgressIndicator(
                strokeWidth: 1,
              )
            : LoadingAnimationWidget.hexagonDots(
                color: color ?? Theme.of(context).primaryColor,
                size: 35,
              ),
        // child:  CircularProgressIndicator(strokeWidth: 3.w,color: color,),
      ),
    );
  }
}

import '../../../../../utils/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ColumnAnimator extends StatefulWidget {
  final List<Widget>? children;

  const ColumnAnimator({
    Key? key,
    this.children,
  }) : super(key: key);

  @override
  ColumnAnimatorState createState() => ColumnAnimatorState();
}

class ColumnAnimatorState extends State<ColumnAnimator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: AnimationLimiter(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    (widget.children ?? []).length,
                    (index) => Column(
                          children: [
                            const SizedBox(height: kPadding),
                            widget.children![index]
                          ],
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

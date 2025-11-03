import 'dart:math';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../utils/screen_utils.dart';
import '../../../../utils/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidgetWithMovingBubble extends StatefulWidget {
  final Color color;
  final String title;
  final IconData icon;

  const CardWidgetWithMovingBubble({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  State<CardWidgetWithMovingBubble> createState() =>
      _CardWidgetWithMovingBubbleState();
}

class _CardWidgetWithMovingBubbleState extends State<CardWidgetWithMovingBubble>
    with SingleTickerProviderStateMixin {
  // late AnimationController? _controller;
  double startX = Random().nextInt((ScreenUtils.screenWidth / 4).ceil()) + 0.0;
  double startY = Random().nextInt((ScreenUtils.screenWidth / 6).ceil()) + 0.0;
  int randomX = Random().nextInt(20);
  int randomY = Random().nextInt(20);
  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this, duration: Duration(seconds: Random().nextInt(10) + 10));
    // _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    // _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: widget.color,
          ).radius(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    FaIcon(widget.icon, color: Colors.white, size: 20),
                  ],
                ),
                const Spacer(),
                const Spacer(),
                AppText(widget.title).header().white(),
                const Spacer(),
              ],
            ),
          ),
        ),

        // Moving bubble
        // Positioned(
        //   top: 0,
        //   right: 0,
        //   child: AnimatedBuilder(
        //     animation: _controller!,
        //     builder: (context, child) {
        //       return Transform.translate(
        //         offset: Offset(
        //           -startX + (_controller!.value * randomX),
        //           startY + (_controller!.value * randomY),
        //         ),
        //         child: child,
        //       );
        //     },
        //     child: Container(
        //       width: 40,
        //       height: 40,
        //       decoration: BoxDecoration(
        //         color: Colors.white.withOpacity(0.2),
        //         shape: BoxShape.circle,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

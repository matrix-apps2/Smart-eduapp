import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final double width;
  final double height;
  final String image;
  final Function onFinished;
  const AnimatedImage({
    required this.width,
    required this.height,
    required this.image,
    required this.onFinished,
    super.key,
  });

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 1));
        widget.onFinished();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Image.asset(
        widget.image,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}

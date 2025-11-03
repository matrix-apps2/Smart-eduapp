import 'package:flutter/material.dart';

class AnimatedLinearProgressBar extends StatefulWidget {
  final Duration duration;
  const AnimatedLinearProgressBar({required this.duration, Key? key}) : super(key: key);

  @override
  AnimatedLinearProgressBarState createState() => AnimatedLinearProgressBarState();
}

class AnimatedLinearProgressBarState extends State<AnimatedLinearProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return LinearProgressIndicator(
          value: _animation.value,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        );
      },
    );
  }
}

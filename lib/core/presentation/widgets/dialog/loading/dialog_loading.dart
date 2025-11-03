import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomDialogLoading extends StatelessWidget {
  final String _message;

  const CustomDialogLoading({
    Key? key,
    required String message,
  })  : _message = message,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 8),
      child: Column(
        children: [
          LoadingAnimationWidget.threeArchedCircle(
            color: Theme.of(context).primaryColor,
            size: 70,
          ),
          const SizedBox(height: 16),
          Text(_message),
        ],
      ),
    );
  }
}

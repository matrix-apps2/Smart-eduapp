import '../core/base/base_states.dart';
import '../core/error/error_model.dart';
import '../core/presentation/widgets/component/error_layout.dart';
import '../core/presentation/widgets/custom_loading_spinner.dart';
import 'package:flutter/material.dart';

class StateView extends StatelessWidget {
  final BaseState state;
  final ErrorModel? error;
  final Function? onRetry;
  final Function? onInitial;
  final Widget child;

  const StateView({
    super.key,
    required this.state,
    required this.child,
    this.error,
    this.onRetry,
    this.onInitial,
  });

  @override
  Widget build(BuildContext context) {
    if (state == BaseState.initial) {
      if (onInitial != null) onInitial!();
    }
    if (state == BaseState.loading) {
      return const Center(child: CustomLoadingSpinner());
    }
    if (state == BaseState.error) {
      return ErrorView(
          errorModel: error,
          onRetry: () {
            if (onRetry != null) onRetry!();
          });
    }
    if (state == BaseState.loaded) {
      return child;
    }
    return Container();
  }
}

import '../../../../core/error/error_model.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import 'package:flutter/material.dart';

import 'component.dart';

class ScreenStateLayout extends StatelessWidget {
  final bool _isEmpty;
  final bool _isLoading;
  final ErrorModel? _error;
  final WidgetBuilder? _errorBuilder;
  final WidgetBuilder? _loadingBuilder;
  final VoidCallback? _onRetry;
  final WidgetBuilder _builder;

  const ScreenStateLayout({
    Key? key,
    required WidgetBuilder builder,
    bool isEmpty = false,
    ErrorModel? error,
    bool isLoading = false,
    WidgetBuilder? errorBuilder,
    WidgetBuilder? loadingBuilder,
    VoidCallback? onRetry,
  })  : _isEmpty = isEmpty,
        _isLoading = isLoading,
        _error = error,
        _errorBuilder = errorBuilder,
        _loadingBuilder = loadingBuilder,
        _builder = builder,
        _onRetry = onRetry,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    if (_isLoading) {
      return _loadingBuilder != null
          ? _loadingBuilder(context)
          : const Center(child: CustomLoadingSpinner());
    } else if (_error != null) {
      return _errorBuilder != null
          ? _errorBuilder(context)
          : ErrorView(
              errorModel: _error,
              onRetry: _onRetry,
            );
    } else if (_isEmpty) {
      return const NoDataScreen();
    } else {
      return _builder(context);
    }
  }
}

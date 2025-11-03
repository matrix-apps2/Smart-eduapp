import '../../../../core/error/error_model.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../../../../utils/resources/values_manager.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatelessWidget {
  final ErrorModel? errorModel;
  final Function()? onRetry;
  final bool logout;

  const ErrorView(
      {Key? key, this.errorModel, this.onRetry, this.logout = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorModel is JsonFailure) {
      JsonFailure jsonFailure = errorModel as JsonFailure;
      return _JsonFailureWidget(jsonFailure, onRetry);
    }
    if (errorModel is ReadableFailure) {
      ReadableFailure readableFailure = errorModel as ReadableFailure;
      return _ReadableFailureWidget(readableFailure, onRetry, logout);
    }

    return Center(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Something went wrong'),
          SizedBox(height: 20.h),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              style: TextButton.styleFrom(shape: retryShape),
              child: Text(Strings().retry,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
        ],
      ),
    ));
  }
}

final retryShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    side: const BorderSide(color: Colors.grey));

class _JsonFailureWidget extends StatelessWidget {
  final JsonFailure jsonFailure;
  final Function()? onRetry;

  const _JsonFailureWidget(this.jsonFailure, this.onRetry);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Lottie.asset(
                Assets.assetsImagesServerError,
                fit: BoxFit.fill,
                width: deviceWidth / 1.6,
                repeat: true,
              ),
            ),
            Text(jsonFailure.message),
            SizedBox(height: 20.h),
            if (onRetry != null)
              TextButton(
                onPressed: onRetry,
                style: TextButton.styleFrom(shape: retryShape),
                child: Text(Strings().retry),
              ),
          ],
        ),
      ),
    );
  }
}

class _ReadableFailureWidget extends StatelessWidget {
  final ReadableFailure readableFailure;
  final Function()? onRetry;
  final bool logout;

  const _ReadableFailureWidget(this.readableFailure, this.onRetry, this.logout);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(readableFailure.message),
            SizedBox(height: 20.h),
            if (onRetry != null)
              TextButton(
                onPressed: onRetry,
                style: TextButton.styleFrom(shape: retryShape),
                child: AppText(Strings().retry),
              ),
            if (logout) ...[
              SizedBox(height: 12.h),
              TextButton(
                onPressed: () {
                  AppPrefs prefs = getIt<AppPrefs>();
                  prefs.logout();
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
                child: AppText(Strings().logout),
              ),
            ],
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}

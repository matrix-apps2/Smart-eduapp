import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../modules/notification/domain/repositories/notification_repository.dart';

class NotificationMarkAsSeenUseCase
    extends BaseUseCase<void, NotificationMarkAsSeenParams> {
  final NotificationRepository repository;

  NotificationMarkAsSeenUseCase(this.repository);

  @override
  Future<Either<ErrorModel, void>> call(
      NotificationMarkAsSeenParams parameters) async {
    return await repository.setNotificationAsSeen(parameters);
  }

  @override
  Future<Either<ErrorModel, void>> callTest(
      NotificationMarkAsSeenParams parameters) {
    throw UnimplementedError();
  }
}

class NotificationMarkAsSeenParams {
  final int notificationId;

  NotificationMarkAsSeenParams({required this.notificationId});

  Map<String, dynamic> toJson() => {
        "notificationToId": notificationId,
      };
}

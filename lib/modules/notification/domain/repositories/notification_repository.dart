import '../../../../core/error/error_model.dart';
import '../../../../modules/notification/data/models/notification_count_response.dart';
import '../../../../modules/notification/domain/usecases/notification/notification_mark_as_seen_usecase.dart';
import '../../../../modules/notification/domain/usecases/notification/notification_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../modules/notification/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<ErrorModel, List<NotificationModel>>> getNotification(
      NotificationParams parameters);

  Future<Either<ErrorModel, void>> setNotificationAsSeen(
      NotificationMarkAsSeenParams parameters);

  Future<Either<ErrorModel, NotificationCountResponse>> getNotificationCount();
}

import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../modules/notification/domain/repositories/notification_repository.dart';
import '../../../../../modules/notification/data/models/notification_count_response.dart';

class NotificationCountUseCase
    extends BaseUseCase<NotificationCountResponse, NoParameters> {
  final NotificationRepository repository;

  NotificationCountUseCase(this.repository);

  @override
  Future<Either<ErrorModel, NotificationCountResponse>> call(
      NoParameters parameters) async {
    return await repository.getNotificationCount();
  }

  @override
  Future<Either<ErrorModel, NotificationCountResponse>> callTest(
      NoParameters parameters) {
    throw UnimplementedError();
  }
}

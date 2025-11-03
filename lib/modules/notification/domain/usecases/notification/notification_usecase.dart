import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../modules/notification/data/models/notification_model.dart';
import '../../../../../modules/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationUseCase
    extends BaseUseCase<List<NotificationModel>, NotificationParams> {
  final NotificationRepository repository;

  NotificationUseCase(this.repository);

  @override
  Future<Either<ErrorModel, List<NotificationModel>>> call(
      NotificationParams parameters) async {
    return await repository.getNotification(parameters);
  }

  @override
  Future<Either<ErrorModel, List<NotificationModel>>> callTest(
      NotificationParams parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    List<NotificationModel> list = List<NotificationModel>.generate(
      10,
      (index) => NotificationModel(
        id: index,
        title: 'Title ${index + 1}',
        body: ' Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        createdAt: DateTime.now(),
        type: index % 2 == 0 ? 'info' : 'warning',
      ),
    );
    return Future.value(Right(list));
  }
}

class NotificationParams {
  final String userId;

  NotificationParams({required this.userId});

  toJson() => {
        "userId": userId,
      };
}

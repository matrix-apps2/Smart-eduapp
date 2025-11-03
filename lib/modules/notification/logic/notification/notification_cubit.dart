import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../modules/notification/data/models/notification_model.dart';
import '../../../../modules/notification/domain/usecases/notification/notification_usecase.dart';
import '../../../../utils/debug/echo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationUseCase notificationUseCase;
  NotificationCubit(
    this.notificationUseCase,
  ) : super(const NotificationState());

  Future<void> getNotification() async {
    kEcho('getNotification');
    initStates();
    emit(state.copyWith(state: BaseState.loading));
    final result = await notificationUseCase.callTest(NotificationParams(
      userId: getIt<AppPrefs>().get(AppPrefsKeys.kuserId, defaultValue: ''),
    ));

    result.fold(
      (error) => emit(state.copyWith(state: BaseState.error, error: error)),
      (data) {
        emit(state.copyWith(state: BaseState.loaded, data: data));
      },
    );
  }

  void initStates() {
    emit(state.copyWith(
      state: BaseState.initial,
      error: null,
    ));
  }
}

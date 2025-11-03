import '../../../../core/base/base_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/notification/domain/usecases/notification_count/notification_count_usecase.dart';
import '../../../../modules/notification/data/models/notification_count_response.dart';

part 'notification_count_state.dart';

class NotificationCountCubit extends Cubit<NotificationCountState> {
  final NotificationCountUseCase notificationCountUseCase;
  NotificationCountCubit(
    this.notificationCountUseCase,
  ) : super(const NotificationCountState());

  Future<void> getNotificationCount() async {
    initStates();
    emit(state.copyWith(state: BaseState.loading));
    final result = await notificationCountUseCase(const NoParameters());

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

  void increaseNotificationCount() {
    int count = state.data?.setting.notificationCount ?? 0;
    emit(state.copyWith(
        state: BaseState.loaded,
        data: NotificationCountResponse(
            setting: SettingTemp(notificationCount: count + 1))));
  }

  void resetNotificationCount() {
    emit(
      state.copyWith(
          state: BaseState.loaded,
          data: NotificationCountResponse(
            setting: const SettingTemp(notificationCount: 0),
          )),
    );
  }
}

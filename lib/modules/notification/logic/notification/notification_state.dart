part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final BaseState state;
  final List<NotificationModel> data;
  final ErrorModel? error;
  const NotificationState({
    this.state = BaseState.initial,
    this.data = const [],
    this.error,
  });

  NotificationState copyWith({
    BaseState? state,
    List<NotificationModel>? data,
    ErrorModel? error,
  }) {
    return NotificationState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];
}

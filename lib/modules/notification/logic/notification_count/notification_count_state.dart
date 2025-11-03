part of 'notification_count_cubit.dart';

class NotificationCountState extends Equatable {
  final BaseState state;
  final NotificationCountResponse? data;
  final ErrorModel? error;
  const NotificationCountState({
    this.state = BaseState.initial,
    this.data,
    this.error,
  });

  NotificationCountState copyWith({
    BaseState? state,
    NotificationCountResponse? data,
    ErrorModel? error,
  }) {
    return NotificationCountState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];


}

part of 'guest_layout_cubit.dart';

class GuestLayoutState extends Equatable {
  final BaseState state;
  final int bottomNavIndex;
  final ErrorModel? error;
  final bool appNeedUpdate;
  const GuestLayoutState({
    this.state = BaseState.initial,
    this.bottomNavIndex = 0,
    this.error,
    this.appNeedUpdate = false,
  });

  GuestLayoutState copyWith({
    BaseState? state,
    int? bottomNavIndex,
    ErrorModel? error,
    bool? appNeedUpdate,
  }) {
    return GuestLayoutState(
      state: state ?? this.state,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
      error: error ?? this.error,
      appNeedUpdate: appNeedUpdate ?? this.appNeedUpdate,
    );
  }

  @override
  List<Object?> get props => [state, bottomNavIndex, error, appNeedUpdate];
}

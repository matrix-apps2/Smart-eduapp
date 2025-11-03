part of 'layout_cubit.dart';

class LayoutState extends Equatable {
  final BaseState state;
  final int bottomNavIndex;
  final ErrorModel? error;
  final bool appNeedUpdate;
  const LayoutState({
    this.state = BaseState.initial,
    this.bottomNavIndex = 0,
    this.error,
    this.appNeedUpdate = false,
  });

  LayoutState copyWith({
    BaseState? state,
    int? bottomNavIndex,
    ErrorModel? error,
    bool? appNeedUpdate,
  }) {
    return LayoutState(
      state: state ?? this.state,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
      error: error ?? this.error,
      appNeedUpdate: appNeedUpdate ?? this.appNeedUpdate,
    );
  }

  @override
  List<Object?> get props => [state, bottomNavIndex, error, appNeedUpdate];
}

part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseState baseState;
  final List<BaseResponse> tasks;
  final ErrorModel? error;
  const HomeState({
    required this.baseState,
    this.tasks = const [],
    this.error,
  });

  @override
  List<Object?> get props => [baseState, tasks, error];

  copyWith({
    BaseState? baseState,
    List<BaseResponse>? tasks,
    ErrorModel? error,
    AccountStatus? accountStatus,
  }) {
    return HomeState(
      baseState: baseState ?? this.baseState,
      tasks: tasks ?? this.tasks,
      error: error ?? this.error,
    );
  }
}

enum AccountStatus { active, notActive, notVerified, notCompleted, suspended , requiredPackage }

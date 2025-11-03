part of 'verify_account_cubit.dart';

class VerifyAccountState extends Equatable {
  final BaseState state;
  final UserModel? data;
  final ErrorModel? error;
  const VerifyAccountState({
    this.state = BaseState.initial,
    this.data,
    this.error,
  });

  VerifyAccountState copyWith({
    BaseState? state,
    UserModel? data,
    ErrorModel? error,
  }) {
    return VerifyAccountState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];
}

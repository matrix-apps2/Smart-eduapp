part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final BaseState state;
  final UserModel? data;
  final ErrorModel? error;
  const RegisterState({
    this.state = BaseState.initial,
    this.data,
    this.error,
  });

  RegisterState copyWith({
    BaseState? state,
    UserModel? data,
    ErrorModel? error,
  }) {
    return RegisterState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];
}

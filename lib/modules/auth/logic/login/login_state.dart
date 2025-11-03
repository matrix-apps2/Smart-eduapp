part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BaseState state;
  final ErrorModel? error;

  const LoginState({this.state = BaseState.initial, this.error});

  LoginState copyWith({
    BaseState? state,
    ErrorModel? error,
  }) {
    return LoginState(
      state: state ?? this.state,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [ state, error ,];
}

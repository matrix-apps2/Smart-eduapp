part of 'password_cubit.dart';

class PasswordState extends Equatable {
  final BaseState state;
  final BaseState changePasswordState;
  final BaseState forgetPasswordState;
  final BaseState? resetPasswordState;
  final UserModel? data;
  final ErrorModel? error;
  final ErrorModel? changePasswordError;
  final ErrorModel? forgetPasswordError;
  final ErrorModel? resetPasswordError;
  const PasswordState({
    this.state = BaseState.initial,
    this.changePasswordState = BaseState.initial,
    this.forgetPasswordState = BaseState.initial,
    this.data,
    this.error,
    this.changePasswordError,
    this.forgetPasswordError,
    this.resetPasswordState,
    this.resetPasswordError,
  });

  PasswordState copyWith({
    BaseState? state,
    BaseState? changePasswordState,
    BaseState? forgetPasswordState,
    BaseState? resetPasswordState,
    UserModel? data,
    ErrorModel? error,
    ErrorModel? changePasswordError,
    ErrorModel? forgetPasswordError,
    ErrorModel? resetPasswordError,
  }) {
    return PasswordState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
      changePasswordState: changePasswordState ?? this.changePasswordState,
      changePasswordError: changePasswordError ?? this.changePasswordError,
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordError: resetPasswordError ?? this.resetPasswordError,
      forgetPasswordError: forgetPasswordError ?? this.forgetPasswordError,
    );
  }

  @override
  List<Object?> get props => [state, data, error , changePasswordState, changePasswordError, forgetPasswordState, forgetPasswordError, resetPasswordState, resetPasswordError];
}

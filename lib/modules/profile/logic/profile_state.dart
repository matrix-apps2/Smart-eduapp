part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final BaseState state;
  final ErrorModel? error;
  final UserModel? profileModel;

  const ProfileState({required this.state, this.error, this.profileModel});

  copyWith({BaseState? state, ErrorModel? error, UserModel? profileModel}) {
    return ProfileState(
      state: state ?? this.state,
      error: error,
      profileModel: profileModel,
    );
  }

  @override
  List<Object?> get props => [state, error, profileModel];
}

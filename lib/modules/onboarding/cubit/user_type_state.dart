enum UserType { barista, cafe }

class UserTypeState {
  final UserType userType;

  UserTypeState({required this.userType});

  UserTypeState copyWith({UserType? userType}) {
    return UserTypeState(
      userType: userType ?? this.userType,
    );
  }
}

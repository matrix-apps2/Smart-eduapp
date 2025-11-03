import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_operation/modules/onboarding/cubit/user_type_state.dart';

class UserTypeCubit extends Cubit<UserTypeState> {
  UserTypeCubit()
      : super(UserTypeState(userType: UserType.barista));

  void changeUserType(UserType newType) {
    emit(state.copyWith(userType: newType));
  }
}

import '../../../../core/base/base_response.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(baseState: BaseState.initial));

  void changeAccountStatus(AccountStatus valu) {
    emit(state.copyWith(accountStatus: valu));
  }
}

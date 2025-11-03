import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/policy/data/models/policy_model.dart';
import '../../../../modules/policy/domain/usecases/policy/policy_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'policy_state.dart';

class PolicyCubit extends Cubit<PolicyState> {
  final PolicyUseCase policyUseCase;
  PolicyCubit(
    this.policyUseCase,
  ) : super(const PolicyState());

  Future<void> getPolicy() async {
    initStates();
    emit(state.copyWith(state: BaseState.loading));
    final result = await policyUseCase(PolicyParams());

    result.fold(
      (error) => emit(state.copyWith(state: BaseState.error, error: error)),
      (data) {
        emit(state.copyWith(state: BaseState.loaded, data: data));
      },
    );
  }

  void initStates() {
    emit(state.copyWith(
      state: BaseState.initial,
      error: null,
    ));
  }
}

import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/packages/data/models/packages_model.dart';
import '../../../../modules/packages/domain/usecases/packages/packages_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final PackagesUseCase packagesUseCase;
  PackagesCubit(
    this.packagesUseCase,
  ) : super(const PackagesState());

  Future<void> getPackages() async {
    initStates();
    emit(state.copyWith(state: BaseState.loading));
    final result = await packagesUseCase.callTest(PackagesParams());

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

import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/about/data/models/about_model.dart';
import '../../../../modules/about/domain/usecases/about/about_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  final AboutUseCase aboutUseCase;
  AboutCubit(
    this.aboutUseCase,
  ) : super(const AboutState());

  Future<void> getAbout() async {
    emit(state.copyWith(state: BaseState.loading));
    final result = await aboutUseCase.callTest(AboutParams());

    result.fold(
      (error) => emit(state.copyWith(state: BaseState.error, error: error)),
      (data) => emit(state.copyWith(state: BaseState.loaded, data: data)),
    );
  }

  void initStates() {
    emit(state.copyWith(
      state: BaseState.initial,
      error: null,
    ));
  }
}

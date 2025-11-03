import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/faq/data/models/faq_model.dart';
import '../../../../modules/faq/domain/usecases/faq/faq_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  final FaqUseCase faqUseCase;
  FaqCubit(
    this.faqUseCase,
  ) : super(const FaqState());

  Future<void> getFaq() async {
    initStates();
    emit(state.copyWith(state: BaseState.loading));

    final result = await faqUseCase.callTest(FaqParams());

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

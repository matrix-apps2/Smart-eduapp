import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/contact_us/data/models/contact_us_model.dart';
import '../../../../modules/contact_us/domain/usecases/contact_us/contact_us_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsUseCase contact_usUseCase;
  ContactUsCubit(
    this.contact_usUseCase,
  ) : super(const ContactUsState());

  Future<void> getContactUs() async {
    initStates();
    emit(state.copyWith(state: BaseState.loading));
    final result = await contact_usUseCase(ContactUsParams());

    result.fold(
      (error) => emit(state.copyWith(state: BaseState.error, error: error)),
      (data) {
        emit(state.copyWith(state: BaseState.loaded, data: [data]));
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

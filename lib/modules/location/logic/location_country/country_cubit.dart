import '../../../../core/base/base_states.dart';
import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../modules/location/data/models/country_model.dart';
import '../../../../modules/location/domain/usecases/countries_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountriesUseCase countriesUseCase;
  CountryCubit(
    this.countriesUseCase,
  ) : super(const CountryState());

  Future<void> getCountries() async {
    if (state.state == BaseState.loading) return;
    if (state.state == BaseState.loaded) return;
    if (state.data.isNotEmpty) return;
    emit(state.copyWith(state: BaseState.loading));
    final result = await countriesUseCase(const NoParameters());

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

import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/firebase_methods.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../utils/constants/const.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'guest_layout_state.dart';

class GuestLayoutCubit extends Cubit<GuestLayoutState> {
  GuestLayoutCubit() : super(const GuestLayoutState());

  void initStates() {
    emit(state.copyWith(
      state: BaseState.initial,
      error: null,
    ));
  }

  void setCurrentIndex(int i) {
    emit(state.copyWith(bottomNavIndex: i));
  }
}

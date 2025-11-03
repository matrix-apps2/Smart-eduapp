import '../../../app.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/base/base_usecase.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../modules/profile/domain/usecases/profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileCubit(this.profileUseCase)
      : super(const ProfileState(state: BaseState.initial));

  Future<void> getProfile() async {
    AppPrefs appPrefs = getIt<AppPrefs>();
    if (appPrefs.get(AppPrefsKeys.token) == null) return;
    emit(const ProfileState(state: BaseState.loading));
    final result = await profileUseCase(const NoParameters());
    result.fold(
      (l) => emit(ProfileState(state: BaseState.error, error: l)),
      (r) {
        emit(ProfileState(state: BaseState.loaded, profileModel: r));
        globalUser = r;
      },
    );
  }
}

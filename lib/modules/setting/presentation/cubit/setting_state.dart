part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final SettingModel? settingModel;
  final BaseState state;

  const SettingState({
    this.settingModel,
    required this.state,
  });

  copyWith({
    SettingModel? settingModel,
    BaseState? state,
  }) {
    return SettingState(
      settingModel: settingModel ?? this.settingModel,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [settingModel, state];
}

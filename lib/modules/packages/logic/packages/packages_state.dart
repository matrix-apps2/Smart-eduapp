part of 'packages_cubit.dart';

class PackagesState extends Equatable {
  final BaseState state;
  final List<PackagesModel> data;
  final ErrorModel? error;
  const PackagesState({
    this.state = BaseState.initial,
    this.data = const [],
    this.error,
  });

  PackagesState copyWith({
    BaseState? state,
    List<PackagesModel>? data,
    ErrorModel? error,
  }) {
    return PackagesState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];
}

part of 'faq_cubit.dart';

class FaqState extends Equatable {
  final BaseState state;
  final List<FaqModel> data;
  final ErrorModel? error;
  const FaqState({
    this.state = BaseState.initial,
    this.data = const [],
    this.error,
  });

  FaqState copyWith({
    BaseState? state,
    List<FaqModel>? data,
    ErrorModel? error,
  }) {
    return FaqState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];
}

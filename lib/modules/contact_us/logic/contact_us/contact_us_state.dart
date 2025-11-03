part of 'contact_us_cubit.dart';

class ContactUsState extends Equatable {
  final BaseState state;
  final List<ContactUsModel> data;
  final ErrorModel? error;
  const ContactUsState({
    this.state = BaseState.initial,
    this.data = const [],
    this.error,
  });

  ContactUsState copyWith({
    BaseState? state,
    List<ContactUsModel>? data,
    ErrorModel? error,
  }) {
    return ContactUsState(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, data, error];
}

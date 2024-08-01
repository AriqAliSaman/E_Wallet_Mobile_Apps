part of 'topup_form_bloc.dart';

abstract class TopupFormState extends Equatable {
  const TopupFormState();

  @override
  List<Object> get props => [];
}

class TopupFormInitial extends TopupFormState {}

class TopupFormLoading extends TopupFormState {}

class TopupFormFailed extends TopupFormState {
  final String e;
  const TopupFormFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TopupFormSuccess extends TopupFormState {
  final String redirectUrl;
  const TopupFormSuccess(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}

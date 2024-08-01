part of 'topup_form_bloc.dart';

abstract class TopupFormEvent extends Equatable {
  const TopupFormEvent();

  @override
  List<Object> get props => [];
}

class TopupFormPost extends TopupFormEvent {
  final TopupFormModel data;
  const TopupFormPost(this.data);

  @override
  List<Object> get props => [data];
}

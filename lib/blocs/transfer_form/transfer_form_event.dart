part of 'transfer_form_bloc.dart';

abstract class TransferFormEvent extends Equatable {
  const TransferFormEvent();

  @override
  List<Object> get props => [];
}

class TransferFormPost extends TransferFormEvent {
  final TransferFormModel data;
  const TransferFormPost(this.data);

  @override
  List<Object> get props => [data];
}

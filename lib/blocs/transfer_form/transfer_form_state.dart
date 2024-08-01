part of 'transfer_form_bloc.dart';

abstract class TransferFormState extends Equatable {
  const TransferFormState();

  @override
  List<Object> get props => [];
}

class TransferFormInitial extends TransferFormState {}

class TransferFormLoading extends TransferFormState {}

class TransferFormFailed extends TransferFormState {
  final String e;
  const TransferFormFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TransferFormSuccess extends TransferFormState {}

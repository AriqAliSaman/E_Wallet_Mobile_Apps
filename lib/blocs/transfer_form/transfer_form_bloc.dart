// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/services/transaction_service.dart';

part 'transfer_form_event.dart';
part 'transfer_form_state.dart';

class TransferFormBloc extends Bloc<TransferFormEvent, TransferFormState> {
  TransferFormBloc() : super(TransferFormInitial()) {
    on<TransferFormEvent>((event, emit) async {
      if (event is TransferFormPost) {
        try {
          emit(TransferFormLoading());

          await TransactionService().transfer(event.data);

          emit(TransferFormSuccess());
        } catch (e) {
          print(e);

          emit(TransferFormFailed(e.toString()));
        }
      }
    });
  }
}

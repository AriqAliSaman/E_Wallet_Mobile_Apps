// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/services/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      try {
        emit(TransactionLoading());

        final transactions = await TransactionService().getTransactions();

        emit(TransactionSuccess(transactions));
      } catch (e) {
        print(e);
        emit(TransactionFailed(e.toString()));
      }
    });
  }
}

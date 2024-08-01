// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/services/transaction_service.dart';

part 'topup_form_event.dart';
part 'topup_form_state.dart';

class TopupFormBloc extends Bloc<TopupFormEvent, TopupFormState> {
  TopupFormBloc() : super(TopupFormInitial()) {
    on<TopupFormEvent>((event, emit) async {
      if (event is TopupFormPost) {
        try {
          emit(TopupFormLoading());

          final res = await TransactionService().topUp(event.data);

          emit(TopupFormSuccess(res));
        } catch (e) {
          print(e);
          emit(TopupFormFailed(e.toString()));
        }
      }
    });
  }
}

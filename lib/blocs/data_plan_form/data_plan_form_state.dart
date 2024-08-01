part of 'data_plan_form_bloc.dart';

abstract class DataPlanFormState extends Equatable {
  const DataPlanFormState();

  @override
  List<Object> get props => [];
}

class DataPlanFormInitial extends DataPlanFormState {}

class DataPlanFormLoading extends DataPlanFormState {}

class DataPlanFormFailed extends DataPlanFormState {
  final String e;
  const DataPlanFormFailed(this.e);

  @override
  List<Object> get props => [e];
}

class DataPlanFormSuccess extends DataPlanFormState {}

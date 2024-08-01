part of 'data_plan_form_bloc.dart';

abstract class DataPlanFormEvent extends Equatable {
  const DataPlanFormEvent();

  @override
  List<Object> get props => [];
}

class DataPlanFormPost extends DataPlanFormEvent {
  final DataPlanFormModel data;
  const DataPlanFormPost(this.data);

  @override
  List<Object> get props => [data];
}

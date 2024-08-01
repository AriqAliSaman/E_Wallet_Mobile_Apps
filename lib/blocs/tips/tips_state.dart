part of 'tips_bloc.dart';

abstract class TipsState extends Equatable {
  const TipsState();

  @override
  List<Object> get props => [];
}

class TipsInitial extends TipsState {}

class TipsLoading extends TipsState {}

class TipsFailed extends TipsState {
  final String e;
  const TipsFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TipsSuccess extends TipsState {
  final List<TipsModel> tips;
  const TipsSuccess(this.tips);

  @override
  List<Object> get props => [tips];
}

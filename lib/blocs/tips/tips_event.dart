part of 'tips_bloc.dart';

abstract class TipsEvent extends Equatable {
  const TipsEvent();

  @override
  List<Object> get props => [];
}

class TipsGet extends TipsEvent {}

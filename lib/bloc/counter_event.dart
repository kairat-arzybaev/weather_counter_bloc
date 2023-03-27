part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {
  @override
  List<Object> get props => [];
}

class Decrement extends CounterEvent {
  @override
  List<Object> get props => [];
}

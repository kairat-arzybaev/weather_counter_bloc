import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) {
      if (state < 10) {
        emit(state + 1);
      }
    });
    on<Decrement>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
  }
}

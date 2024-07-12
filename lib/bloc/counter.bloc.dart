//Events
import 'package:bloc/bloc.dart';

abstract class Counterevent {}

class IncrementCounterEvent extends Counterevent {}

class DecrementCounterEvent extends Counterevent {}

//State
abstract class CounterState {
  final int counter;
  const CounterState({required this.counter});
}

class CounterSuccessState extends CounterState {
  CounterSuccessState({required int counter}) : super(counter: counter);
}

class CounterErrorState extends CounterState {
  final String errormessage;

  CounterErrorState({required int counter, required this.errormessage})
      : super(counter: counter);
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counter: 0);
}

//bloc
class CounterBloc extends Bloc<Counterevent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on((IncrementCounterEvent event, emit) {
      if (state.counter < 10) {
        int countervalue = state.counter + 1;
        emit(CounterSuccessState(counter: countervalue));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errormessage: "Counter value can't exceed 10!!!"));
      }
    });
    on((DecrementCounterEvent event, emit) {
      if (state.counter > 0) {
        int countervalue = state.counter - 1;
        emit(CounterSuccessState(counter: countervalue));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errormessage: "Counter value can't be less than 0!!!"));
      }
    });
  }
}

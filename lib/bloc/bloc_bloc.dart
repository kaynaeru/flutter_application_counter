import 'package:bloc/bloc.dart';
import 'package:flutter_application_counter/bloc/bloc_event.dart';
import 'package:flutter_application_counter/bloc/bloc_state.dart';

class bloc_bloc extends Bloc<bloc_event, bloc_state> {
  int nilai = 0;

  bloc_bloc() : super(InitialState()) {
    on<NumberIncrementEvent>(numberIncrementMethod);
    on<NumberDecrementEvent>(numberDecrementMethod);
  }

  void numberIncrementMethod(NumberIncrementEvent event, Emitter<bloc_state> emit) {
    nilai += event.number;
    emit(UpdateState(nilai));
  }

  void numberDecrementMethod(NumberDecrementEvent event, Emitter<bloc_state> emit) {
    nilai -= event.number;
    emit(UpdateState(nilai));
  }

}

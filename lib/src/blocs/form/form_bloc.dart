import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  @override
  FormState get initialState => FormState.initial();

  @override
  Stream<FormState> mapEventToState(
    FormEvent event,
  ) async* {
    if(event is NameChangeEvent){
      yield state.copyWith(name: event.name);
    }else if (event is EmailChangeEvent) {
      yield state.copyWith(email: event.email);
    }else if(event is AgeChangeEvent){
      yield state.copyWith(age: event.age);
    }
  }
}

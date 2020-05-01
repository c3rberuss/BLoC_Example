import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();
}

class NameChangeEvent extends FormEvent {
  final String name;

  NameChangeEvent(this.name);

  @override
  List<Object> get props => [name];
}

class EmailChangeEvent extends FormEvent {
  final String email;

  EmailChangeEvent(this.email);

  @override
  List<Object> get props => [email];
}

class AgeChangeEvent extends FormEvent {
  final String age;

  AgeChangeEvent(this.age);

  @override
  List<Object> get props => [age];
}

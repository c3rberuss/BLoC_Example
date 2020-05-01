import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class FormState extends Equatable {
  final String name;
  final String email;
  final String age;

  FormState({@required this.name, @required this.email, @required this.age});

  factory FormState.initial() {
    return FormState(name: "", email: "", age: "");
  }

  FormState copyWith({String name, String email, String age}) {
    return FormState(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }

  @override
  List<Object> get props => [name, email, age];
}

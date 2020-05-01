import 'package:blocexample/src/blocs/form/bloc.dart' as fBloc;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _ageFocus = FocusNode();

  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final _bloc = BlocProvider.of<fBloc.FormBloc>(context);

    _nameController.addListener(() => _bloc.add(fBloc.NameChangeEvent(_nameController.text)));
    _emailController.addListener(() => _bloc.add(fBloc.EmailChangeEvent(_emailController.text)));
    _ageController.addListener(() => _bloc.add(fBloc.AgeChangeEvent(_ageController.text)));

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Example'),
      ),
      body: BlocBuilder<fBloc.FormBloc, fBloc.FormState>(
        builder: (BuildContext context, fBloc.FormState state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("{ name: ${state.name}, email: ${state.email}, age: ${state.age}}"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                TextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Name"
                  ),
                ),
                TextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email"
                  ),
                ),
                TextField(
                  controller: _ageController,
                  focusNode: _ageFocus,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age"
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

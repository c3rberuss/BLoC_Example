import 'package:blocexample/src/presentation/screens/home_screen.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/form/form_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormBloc>(
      create: (BuildContext context) {
        return FormBloc();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen.navigate(
          name: 'assets/todo.flr',
          next: (context) => HomeScreen(),
          until: () => Future.delayed(Duration(seconds: 5)),
          startAnimation: 'start',
          loopAnimation: 'start',
        ),
      ),
    );
  }
}

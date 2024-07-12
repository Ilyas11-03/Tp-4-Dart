import 'package:enset_app2/bloc/theme.bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter1.statefull.page.dart';
import 'counter2.statefull.page.dart';
import 'gitusers.page.dart';
import 'home.page.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        theme: state.themeData,
        routes: {
          "/": (context) => const HomePage(),
          "/counter1": (context) => const Counter1Statefull(),
          "/counter2": (context) => const Counter2Statefull(),
          "/users": (context) => const gitUsers(),
        },
        initialRoute: "/",
      );
    });
  }
}

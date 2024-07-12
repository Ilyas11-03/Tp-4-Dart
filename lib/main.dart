import 'package:enset_app2/bloc/counter.bloc.dart';
import 'package:enset_app2/bloc/theme.bloc.dart';
import 'package:enset_app2/bloc/user.bloc.dart';
import 'package:enset_app2/ui/pages/counter1.statefull.page.dart';
import 'package:enset_app2/ui/pages/counter2.statefull.page.dart';
import 'package:enset_app2/ui/pages/gitusers.page.dart';
import 'package:enset_app2/ui/pages/home.page.dart';
import 'package:enset_app2/ui/pages/root.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => Usersbloc()),
      ],
      child: const RootView(),
    );
  }
}

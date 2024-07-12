import 'package:enset_app2/bloc/counter.bloc.dart';
import 'package:enset_app2/ui/widget/main.drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter1Statefull extends StatelessWidget {
  const Counter1Statefull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: const Text("Counter1 statefull"),
        ),
        body: Center(child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterSuccessState || state is CounterInitialState) {
              return Text(
                "Counter value => ${state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              );
            } else if (state is CounterErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Counter value => ${state.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    state.errormessage,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "dec",
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
              child: Icon(Icons.remove),
            ),
            const SizedBox(
              width: 6,
            ),
            FloatingActionButton(
              heroTag: "inc",
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
              child: Icon(Icons.add),
            )
          ],
        ));
  }
}

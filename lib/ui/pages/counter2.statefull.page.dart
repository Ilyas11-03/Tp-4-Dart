import 'package:enset_app2/ui/widget/main.drawer.widget.dart';
import 'package:flutter/material.dart';

class Counter2Statefull extends StatefulWidget {
  const Counter2Statefull({super.key});

  @override
  State<Counter2Statefull> createState() => _Counter2StatefullState();
}

class _Counter2StatefullState extends State<Counter2Statefull> {
  int counter = 0;
  String errormessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text("Counter2 statefull"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Counter2 value => $counter"),
          (errormessage != "")
              ? Text(
                  "$errormessage",
                  style: const TextStyle(fontSize: 22, color: Colors.teal),
                )
              : const Text("")
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (counter > 0) {
                  --counter;
                  errormessage = "";
                } else {
                  errormessage = "Counter value cannot be less than 0!!!!";
                }
              });
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (counter < 10) {
                  ++counter;
                  errormessage = "";
                } else {
                  errormessage = "Counter value cannot be more than 10!!";
                }
              });
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

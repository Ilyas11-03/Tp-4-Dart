import 'package:enset_app2/ui/widget/main.drawer.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}

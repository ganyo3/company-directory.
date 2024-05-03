import 'package:flutter/material.dart';

class Persons extends StatefulWidget {
  @override
  const Persons({super.key});

  @override
  State<StatefulWidget> createState() {
    return PersosState();
  }
}

class PersosState extends State<Persons> {
  @override
  Widget build(BuildContext constext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Persons"),
        centerTitle: true,
      ),
    );
  }
}

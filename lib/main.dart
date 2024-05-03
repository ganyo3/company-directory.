import 'package:flutter/material.dart';

import 'directory.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, title: "APIs", 
      home: Directory()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Directories"),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
        ),
      ),
    );
  }
}

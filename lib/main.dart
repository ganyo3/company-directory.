// import 'dart:io';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'directory.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "APIs",
    home: Directory(storage: DataStorage(),),
  ));
}

class MyHomePage extends StatefulWidget {
  // final DataStor age storage;
  const MyHomePage({
    super.key,
  }); //required this.storage});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(  "Directories"),
      ),
      body: const Center(
        child: Column(),
      ),
    );
  }
}

// picsum.photos
// logic to detect placeimg
import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  @override
  const Books({super.key});

  @override
  State<StatefulWidget> createState() {
    return BooksState();
  }
}

class BooksState extends State<Books> {
  @override
  Widget build(BuildContext constext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        centerTitle: true,
      ),
    );
  }
}

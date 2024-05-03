import 'package:flutter/material.dart';

class Company extends StatefulWidget {
  @override
  const Company({super.key});

  @override
  State<StatefulWidget> createState() {
    return CompanyState();
  }
}

class CompanyState extends State<Company> {
  @override
  Widget build(BuildContext constext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
        centerTitle: true,
      ),
    );
  }
}

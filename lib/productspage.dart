import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  const Product({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductState();
  }
}

class ProductState extends State<Product> {
  @override
  Widget build(BuildContext constext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        centerTitle: true,
      ),
    );
  }
}

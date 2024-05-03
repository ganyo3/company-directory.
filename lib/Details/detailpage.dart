// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<List<dynamic>> fetchCompanyAlbum() async {
//   var comp = await http.get(Uri.parse('https://randomuser.me/api/?results=20'));
//   return jsonDecode(comp.body)['data'];
// }
// @override
// void initState() {
//   response = fetchCompanyAlbum();
//   super.initState();
// }
// ignore_for_file: camel_case_types
class Company_Detail {
  String name;
  String label;
  String imageUrl;

  Company_Detail(
    this.name,
    this.label,
    this.imageUrl,
  );

  static List<Company_Detail> samples = [
    Company_Detail(
      'Company Name',
      "Our RESTful API provides a straightforward way to interact with the Potter DB, adhering to the JSON:API and OAS specification. In this section, we'll cover the key aspects of using the REST API, including the available endpoints and how to format your requests and responses.",
      "assets/images/product1.jpg",
    ),
    Company_Detail(
      'Company Name',
      "Our RESTful API provides a straightforward way to interact with the Potter DB, adhering to the JSON:API and OAS specification. In this section, we'll cover the key aspects of using the REST API, including the available endpoints and how to format your requests and responses.",
      "assets/images/product1.jpg",
    ),
    Company_Detail(
      'Company Name',
      "Our RESTful API provides a straightforward way to interact with the Potter DB, adhering to the JSON:API and OAS specification. In this section, we'll cover the key aspects of using the REST API, including the available endpoints and how to format your requests and responses.",
      "assets/images/product1.jpg",
    ),
    Company_Detail(
      'Company Name',
      "Our RESTful API provides a straightforward way to interact with the Potter DB, adhering to the JSON:API and OAS specification. In this section, we'll cover the key aspects of using the REST API, including the available endpoints and how to format your requests and responses.",
      "assets/images/product1.jpg",
    ),
    Company_Detail(
      'Company Name',
      "Our RESTful API provides a straightforward way to interact with the Potter DB, adhering to the JSON:API and OAS specification. In this section, we'll cover the key aspects of using the REST API, including the available endpoints and how to format your requests and responses.",
      "assets/images/product1.jpg",
    ),
    Company_Detail(
      'Company Name',
      "Our RESTful API provides a straightforward way to interact with the Potter DB, adhering to the JSON:API and OAS specification. In this section, we'll cover the key aspects of using the REST API, including the available endpoints and how to format your requests and responses.",
      "assets/images/product1.jpg",
    ),
  ];
}

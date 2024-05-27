import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchPersons() async {
  var result = await http.get(Uri.parse(
      'https://fakerapi.it/api/v1/persons?_quantity=20&_gender=male&_birthday_start=2005-01-01'));
  return jsonDecode(result.body)['data'];
}

class Album {
  final String firstname;
  final String lastname;
  final String email;
  final String image;
  final String phone;

  const Album({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.image,
    required this.phone,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'firstname': String firstname,
        'lastname': String lastname,
        'email': String email,
        'image': String image,
        'phone': String phone
      } =>
        Album(
            firstname: firstname,
            lastname: lastname,
            email: email,
            image: image,
            phone: phone),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class Persons extends StatefulWidget {
  @override
  const Persons({super.key});

  @override
  State<StatefulWidget> createState() {
    return PersonsState();
  }
}

class PersonsState extends State<Persons> {
  late Future<dynamic> futurePersons;
  @override
  void initState() {
    futurePersons = fetchPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Persons",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
                future: futurePersons,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1), () {
                   setState(() {
                      futurePersons = fetchPersons();
                   });
                  });
                },
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              children: [
                               ListTile(
                                  title: Text(snapshot.data[index]['firstname'] +
                                      " " +
                                      snapshot.data[index]['lastname']),
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      snapshot.data[index]['image'],
                                    ),
                                  ),
                                  subtitle: Text(snapshot.data[index]['phone']),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
        ), 
      ),
              );
            }
  }

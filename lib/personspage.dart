import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAlbum() async {
  var result = await http
      .get(Uri.parse('https://fakerapi.it/api/v1/persons?_quantity=20&_gender=male&_birthday_start=2005-01-01'));
  return jsonDecode(result.body)['data'];
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
  late Future<dynamic> futureAlbum;
  @override
  void initState() {
    futureAlbum = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Persons",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.005,
                    vertical: size.width * 0.005,
                  ),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: size.height * 0.3,
                              right: size.width * 0.4,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                            ),
                            child: FutureBuilder<dynamic>(
                              future: futureAlbum,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Image(
                                      image: AssetImage(
                                          snapshot.data[index]['image']));
                                } else {
                                  return Text('${snapshot.error}');
                                }
                                // By default, show a loading spinner.
                              },
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            // return const CircularProgressIndicator();
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.height * 0.01,
                              ),
                              child: FutureBuilder<dynamic>(
                                future: futureAlbum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data[index]['firstname'] +" "+ snapshot.data[index]['lastname']);
                                  } else {
                                    return Text('${snapshot.error}');
                                  }
                                  // By default, show a loading spinner.
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.height * 0.01,
                              ),
                              child: FutureBuilder<dynamic>(
                                future: futureAlbum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data[index]['email']);
                                  } else {
                                    return Text('${snapshot.error}');
                                  }
                                  // By default, show a loading spinner.
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.height * 0.01,
                              ),
                              child: FutureBuilder<dynamic>(
                                future: futureAlbum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data[index]['phone']);
                                  } else {
                                    return Text('${snapshot.error}');
                                  }
                                  // By default, show a loading spinner.
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.height * 0.01,
                              ),
                              child: FutureBuilder<dynamic>(
                                future: futureAlbum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                        snapshot.data[index]['birthday']);
                                  } else {
                                    return Text('${snapshot.error}');
                                  }
                                  // By default, show a loading spinner.
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: size.height * 0.2,
                                left: size.height * 0.01,
                              ),
                              child: FutureBuilder<dynamic>(
                                future: futureAlbum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data[index]['gender']);
                                  } else {
                                    return Text('${snapshot.error}');
                                  }
                                  // By default, show a loading spinner.
                                },
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.25,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

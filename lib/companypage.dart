// import 'package:directories/directory.dartimport 'dart:
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'main.dart';

Future<List<dynamic>> fetchAlbum() async {
  var result = await http
      .get(Uri.parse('https://fakerapi.it/api/v1/companies?_quantity=20'));
  return jsonDecode(result.body)['data'];
}

class Company extends StatefulWidget {
  const Company({super.key});

  @override
  State<StatefulWidget> createState() {
    return CompanyState();
  }
}

class CompanyState extends State<Company> {
  late Future<dynamic> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Company",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        futureAlbum = fetchAlbum();
                      });
                    });
                  },
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: size.height * 0.3,
                                        right: size.width * 0.4,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              topLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data[index]['image']))),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      // return const CircularProgressIndicator();
                                      Padding(
                                        padding: EdgeInsets.only(
                                          // bottom: size.height * 0.2,
                                          left: size.height * 0.01,
                                        ),
                                        child:
                                            Text(snapshot.data[index]['name']),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: size.height * 0.2,
                                          left: size.height * 0.01,
                                        ),
                                        child:
                                            Text(snapshot.data[index]['email']),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.25,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.03),
                                        child: SizedBox(
                                          width: size.width * 0.45,
                                          height: size.width * 0.1,
                                          child: FloatingActionButton.extended(
                                            backgroundColor: Colors.blue,
                                            shape: ContinuousRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            extendedPadding:
                                                const EdgeInsets.all(55),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            label: const Text(
                                              'More Details',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child:  Text(
                      'There was an error☹️!\n Check your internet connection and try again',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                      ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

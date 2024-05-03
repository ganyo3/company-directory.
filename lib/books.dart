import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAlbum() async {
  var result = await http
      .get(Uri.parse('https://fakerapi.it/api/v1/books?_quantity=20'));
  return jsonDecode(result.body)['data'];
}

class Books extends StatefulWidget {
  @override
  const Books({super.key});

  @override
  State<StatefulWidget> createState() {
    return BooksState();
  }
}

class BooksState extends State<Books> {
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
          "Books",
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
                          fit: FlexFit.loose,
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
                                   return Image(image:AssetImage(snapshot.data[index]['image']));
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
                                 // bottom: size.height * 0.2,
                                 left: size.height * 0.01,
                               ),
                               child: FutureBuilder<dynamic>(
                                  future: futureAlbum,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data[index]['title']);
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
                                     return Text(snapshot.data[index]['author']);
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
                                     return Text(snapshot.data[index]['genre']);
                                   } else {
                                     return Text('${snapshot.error}');
                                   }
                                   // By default, show a loading spinner.
                                 },
                               ),
                             ),
                            //  Padding(
                            //    padding: EdgeInsets.only(
                            //      bottom: size.height * 0.2,
                            //      left: size.height * 0.01,
                            //    ),
                            //    child: FutureBuilder<dynamic>(
                            //      future: futureAlbum,
                            //      builder: (context, snapshot) {
                            //        if (snapshot.hasData) {
                            //          return Text(snapshot.data[index]['description']);
                            //        } else {
                            //          return Text('${snapshot.error}');
                            //        }
                            //        // By default, show a loading spinner.
                            //      },
                            //    ),
                            //  ),
                             SizedBox(
                               width: size.width * 0.25,
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: size.width * 0.03),
                               child: SizedBox(
                                 width: size.width * 0.45,
                                 height: size.width * 0.1,
                                 child: FloatingActionButton.extended(
                                   backgroundColor: Colors.blue,
                                   shape: ContinuousRectangleBorder(
                                       borderRadius: BorderRadius.circular(10)),
                                   extendedPadding: const EdgeInsets.all(55),
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

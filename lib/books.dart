import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchBooks() async {
  var result = await http
      .get(Uri.parse('https://fakerapi.it/api/v1/books?_quantity=20'));
  return jsonDecode(result.body)['data'];
}

class Album {
  final String title;
  final String author;
  final String genre;
  final String image;

  const Album({
    required this.title,
    required this.author,
    required this.genre,
    required this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String title,
        'author': String author,
        'genre': String genre,
        'image': String image,
      } =>
        Album(
          title: title,
          author: author,
          genre: genre,
          image: image,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
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
  late Future<dynamic> futureBooks;
  @override
  void initState() {
    futureBooks = fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Books",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: futureBooks,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 0), () {
                   setState(() {
                      futureBooks = fetchBooks();
                   });
                  });
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data[index]['title'] +
                                " " +
                                snapshot.data[index]['author']),
                            // trailing: Text(snapshot.data[index]['genre']),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                snapshot.data[index]['image'],
                              ),
                            ),
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

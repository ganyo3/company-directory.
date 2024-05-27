import 'package:directories/books.dart';
import 'package:directories/companypage.dart';
import 'package:directories/personspage.dart';
import 'package:directories/productspage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataStorage {
  Future<dynamic> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//getting the local path
  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/content.txt');
  }

  Future<int> readData() async {
    try {
      final file = await localFile;
      //reading file
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeData(int selectedIndex) async {
    final file = await localFile;
    //writing file
    return file.writeAsString('$selectedIndex');
  }
}
//network statemanagement local storage
class Directory extends StatefulWidget {
  final DataStorage storage;
  const Directory({super.key, required this.storage});

  @override
  State<StatefulWidget> createState() {
    return DirectoryState();
  }
}

class DirectoryState extends State<Directory> {
  // late Future<dynamic> futureAlbum = fetchAlbum();
  // late Future<dynamic> futureProduct = fetchProduct();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((value) {
      setState(() {
        _selectedIndex = value;
      });
    });
  }
  
 Future<File> _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    return widget.storage.writeData(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    //  var size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Company(),
          Product(),     
          Persons(),
          Books(),
        ],
      ),

     bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        // 5
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 15,
        unselectedFontSize: 10,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.factory_sharp),
            label: "Company",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Persons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Books",
          )
        ],
      ),
    );
  }
}

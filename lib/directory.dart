import 'package:flutter/material.dart';
import 'companypage.dart';
import 'books.dart';
import 'personspage.dart';
import 'productspage.dart';

class Directory extends StatefulWidget {
 @override
  const Directory({super.key});

  @override
  State<StatefulWidget> createState() {
    return DirectoryState();
  }
}

class DirectoryState extends State<Directory> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
   const Company(),
    const Product(),
    const Persons(),
    const Books(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
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

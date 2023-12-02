import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom App Bar with FAB Notch'),
      ),
      body: Center(
        child: Text('Content goes here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB action here
          print('FAB Pressed');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Add your menu action here
                print('Menu Pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add your search action here
                print('Search Pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar with FAB Notch'),
      ),
      body: const Center(
        child: Text('Content goes here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB action here
          print('FAB Pressed');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Add your menu action here
                print('Menu Pressed');
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
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
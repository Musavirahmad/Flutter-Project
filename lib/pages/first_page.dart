// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      drawer: Drawer(
        backgroundColor: Colors.green,
        child: Column(children: [
          DrawerHeader(
            child: Icon(Icons.access_alarm),
          ),
        ]),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go To Second Page"),
          onPressed: () {
            Navigator.pushNamed(context, '/secondpage');
          },
        ),
      ),
    );
  }
}

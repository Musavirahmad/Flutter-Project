import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
          child: ElevatedButton(
        child: Text("Go To Home"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstPage(),
            ),
          );
        },
      )),
    );
  }
}

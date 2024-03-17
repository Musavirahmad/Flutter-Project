// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/first_page.dart';
import 'package:flutter_application_1/pages/second_page.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   void userLongPress() {
//     print("User Loves the app");
//   }

//   // List countries = ["Pakistan", "india", "Canada"];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         // backgroundColor: Colors.green,
//         appBar: AppBar(
//           title: Text("Brackits app"),
//           backgroundColor: Colors.lightGreen,
//           elevation: 0,
//           leading: Icon(Icons.menu),
//           actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
//         ),
//         body: Center(
//           child: GestureDetector(
//             onLongPress: userLongPress,
//             child: Container(
//               height: 300,
//               width: 300,
//               // color: Colors.green,
//               decoration: BoxDecoration(
//                   color: Colors.lightBlue,
//                   borderRadius: BorderRadius.circular(20)),
//               padding: EdgeInsets.all(25),
//               child: Icon(
//                 Icons.favorite,
//                 color: Colors.red,
//                 size: 40,
//               ),
//               // child: Text(
//               //   "Brackits",
//               //   style: TextStyle(fontSize: 28, color: Colors.black),
//               // ),
//             ),
//           ),
//         ),
//         // body: ListView(
//         //   scrollDirection: Axis.horizontal,
//         //   children: [
//         //     Container(
//         //       height: 350,
//         //       color: Colors.deepPurple,
//         //     ),
//         //     Container(
//         //       height: 350,
//         //       color: Colors.deepPurple[400],
//         //     ),
//         //     Container(
//         //       height: 350,
//         //       color: Colors.deepPurple[200],
//         //     )
//         //   ],
//         // ),

//         // body: GridView.builder(
//         //   itemCount: 64,
//         //   gridDelegate:
//         //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//         //   itemBuilder: (context, index) => Container(
//         //     color: Colors.deepPurple,
//         //     margin: EdgeInsets.all(2),
//         //   ),
//         // ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage': ((context) => FirstPage()),
        '/secondpage': ((context) => SecondPage())
      },
    );
  }
}

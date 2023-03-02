// import 'dart:js';

import 'package:blood_donation_app/pages/ListDonors.dart';
import 'package:blood_donation_app/pages/addDonor.dart';
import 'package:blood_donation_app/pages/home.dart';
import 'package:flutter/material.dart';
// import 'package:my_first_flutter_app/widgets/container.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
        title: "Demo App",
        // home: Home(),
        routes: {'/': (context) => Home(), '/add': (context) => AddDonor(),'/list-donors':(context) => ListDonors()},
        initialRoute: '/');
  }
}

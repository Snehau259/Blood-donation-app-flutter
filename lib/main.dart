import 'dart:js';
import 'package:blood_donation_app/pages/ListDonors.dart';
import 'package:blood_donation_app/pages/addDonor.dart';
import 'package:blood_donation_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB2Vgx8ehS4gr1bwZXYknDbuFmQ4O6hlQw",
      appId: "1:69722884320:android:31a5771a398fa33c7ca885",
      messagingSenderId: " ",
      projectId: "blood-donation-app-d4432",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
        title: "Demo App",
        // home: Home(),
        routes: {
          '/': (context) => Home(),
          '/add': (context) => AddDonor(),
          '/list-donors': (context) => ListDonors()
        },
        initialRoute: '/');
  }
}

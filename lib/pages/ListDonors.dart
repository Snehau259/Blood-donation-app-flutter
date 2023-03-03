import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ListDonors extends StatefulWidget {
  const ListDonors({super.key});

  @override
  State<StatefulWidget> createState() => ListDonorsState();
}

class ListDonorsState extends State<ListDonors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Donors Details", style: TextStyle(fontSize: 25)),
          backgroundColor: Colors.red[500]),
    );
  }
}

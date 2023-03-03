import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Blood Donation", style: TextStyle(fontSize: 25)),
          backgroundColor: Colors.red[500]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          backgroundColor: Colors.red[500],
          child: Icon(Icons.add, size: 20)),
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                  return Text(donorSnap['donorName']);
                });
          }
          return Container();
        },
      ),
    );
  }
}

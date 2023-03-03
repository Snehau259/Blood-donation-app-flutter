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
    return Scaffold(backgroundColor: Colors.black,
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
                  // return Text(donorSnap['donorName']);
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 27, 26, 26),
                                spreadRadius: 15,
                                blurRadius: 10)
                          ]),
                      // color: Colors.blue,
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.cyan,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                    backgroundColor: Colors.red[500],
                                    radius: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(donorSnap['bloodGroup'],
                                          style: TextStyle(fontSize: 15)),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(donorSnap['donorName'],
                                      style: TextStyle(fontSize: 15,color: Colors.white)),
                                  Text(donorSnap['contactNumber'].toString(),
                                      style: TextStyle(fontSize: 15,color: Colors.white))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  IconButton(
                                      color: Colors.blue[400],
                                      onPressed: () {},
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      color: Colors.blue[400],
                                      onPressed: () {},
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            )
                          ]),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}

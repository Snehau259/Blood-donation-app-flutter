import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class UpdateDonor extends StatefulWidget {
  const UpdateDonor({super.key});

  @override
  State<StatefulWidget> createState() => UpdateDonorState();
}

class UpdateDonorState extends State<UpdateDonor> {
  final bloodGroups = ["A+ve", "B+ve", "A-ve", "B-ve", "AB+ve", "O+ve", "O-ve"];
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  void UpdateDonor(id) {
    final data = {
      'donorName': donorName.text,
      'bloodGroup': donorsBloodGroup,
      'contactNumber': contactNumber.text
    };
    donor.doc(id).update(data);
  }

  TextEditingController donorName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();

  String donorsBloodGroup = "";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    donorName.text = args['name'];
    contactNumber.text = args['phone'];
    donorsBloodGroup = args['bloodGroup'];
    final id = args['id'];
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 26, 26),
        appBar: AppBar(
          title: Text(
            "Update Donor details",
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.red[500],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: donorName,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 250, 248, 248)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(20),
                        label: Text("Donor Name"),
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 250, 248, 248)))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: contactNumber,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 250, 248, 248)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(20),
                        label: Text("Contact Number"),
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 250, 248, 248)))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: DropdownButtonFormField(value: donorsBloodGroup,
                    dropdownColor: Color.fromARGB(255, 56, 55, 55),
                    style: const TextStyle(
                      color: Colors.white, //<-- SEE HERE
                      fontSize: 17,
                      // fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        label: Text("Select your blood group",
                            style: TextStyle(fontSize: 17)),
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 250, 248, 248))),
                    items: bloodGroups
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (value) {
                      donorsBloodGroup = value as String;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      UpdateDonor(id);
                      print(args);
                      Navigator.pushNamed(context, '/');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[500]),
                        minimumSize: MaterialStatePropertyAll(Size(300, 50))),
                    child: Text("Update", style: TextStyle(fontSize: 20))),
              )
            ],
          ),
        ));
  }
}

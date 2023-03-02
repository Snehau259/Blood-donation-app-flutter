import 'dart:html';

import 'package:flutter/material.dart';

class AddDonor extends StatefulWidget {
  const AddDonor({super.key});

  @override
  State<StatefulWidget> createState() => AddDonorState();
}

class AddDonorState extends State<AddDonor> {
  final bloodGroups = ["A+ve", "B+ve", "A-ve", "B-ve", "AB+ve"];
  String donorsBloodGroup = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Donor",
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        label: Text("Donor Name"))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        label: Text("Contact Number"))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButtonFormField(
                    decoration:
                        InputDecoration(label: Text("Select your blood group")),
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
                      Navigator.pushNamed(context, '/list-donors');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[500]),
                        minimumSize: MaterialStatePropertyAll(Size(300, 50))),
                    child: Text("Submit", style: TextStyle(fontSize: 20))),
              )
            ],
          ),
        ));
  }
}

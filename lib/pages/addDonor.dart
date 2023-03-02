import 'dart:html';

import 'package:flutter/material.dart';

class AddDonor extends StatefulWidget {
  const AddDonor({super.key});

  @override
  State<StatefulWidget> createState() => AddDonorState();
}

class AddDonorState extends State<AddDonor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Add New Donor",
        style: TextStyle(fontSize: 30),
      ),backgroundColor: Colors.red[300],)
    );
  }
}

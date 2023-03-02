import 'package:flutter/material.dart';

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

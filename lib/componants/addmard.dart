import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_new_version/componants/showdata.dart';

class addmard extends StatefulWidget {
  const addmard({super.key});
  final String name = 'dignosis';
  @override
  State<addmard> createState() => _addmardState();
}

class _addmardState extends State<addmard> {
  List data = [];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("diseases").get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      // drawer: MyDrawer(),
      body: ListView(children: [
        Container(
          width: 300,
          height: 300,
          child: Image(
            image: AssetImage(
              "assets/resultpic.png",
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showdata(field: "${data[1]['diseasename']}", data: 'diseasename'),
              showdata(field: "${data[1]['discribtion']}", data: 'discribtion'),
              showdata(field: "${data[1]['treatment']}", data: 'treatment'),
            ],
          ),
        ),
      ]),
    );
  }
}

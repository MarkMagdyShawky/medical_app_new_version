// ignore_for_file: use_super_parameters
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_new_version/componants/showdata.dart';
import 'package:medical_app_new_version/componants/MyDrawer.dart';

class result extends StatefulWidget {
  final Map<String, dynamic> apiresult;
  const result(this.apiresult, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _resultState();
}

// ignore: non_constant_identifier_names
class _resultState extends State<result> {
  late Map<String, dynamic> data;
  @override
  void initState() {
    data = widget.apiresult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Result'),
      ),
      drawer: MyDrawer(),
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
                showdata(field: "${data['name']}", data: 'You may have: '),
                showdata(field: "${data['description']}", data: 'Description: '),
                showdata(field: "${data['symptoms']}", data: 'Symptoms: '),
                showdata(field: "${data['treatment']}", data: 'We suggest you to do: '),
              ]),
        ),
      ]),
    );
  }
}

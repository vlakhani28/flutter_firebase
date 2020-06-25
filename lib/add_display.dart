import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

  class AddDisplay extends StatefulWidget {
    static const String id = 'addscreen';
    @override
    _AddDisplayState createState() => _AddDisplayState();
  }

  class _AddDisplayState extends State<AddDisplay> {
    final _auth = FirebaseAuth.instance;
    String department;
    String class_name;
    String name;
    final _firestore = Firestore.instance;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
          child: SingleChildScrollView(
          child: Container(
          child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(decoration: InputDecoration(hintText: "Enter Department"),onChanged: (value){department = value;},),
              SizedBox(height: 8,),
              TextField(decoration: InputDecoration(hintText: "Enter Class Name"),onChanged: (value){class_name = value;},),
              SizedBox(height: 8,),
              TextField(decoration: InputDecoration(hintText: "Enter Students Name"),onChanged: (value){name = value;},),
              SizedBox(height: 8,),
              Row(children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Add",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                    ),
                    onPressed: () async {
                      await _firestore.collection('students').add({
                        'Class': class_name,
                        'Department': department,
                        'Student_Name': name,
                      });

                      print("Data added");
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Display",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                    ),
                    onPressed: () async {
                      await _firestore.collection('students').where("Class",isEqualTo: class_name).where("Department" ,isEqualTo: department).snapshots().listen((data) {data.documents.forEach((doc) {print(doc['Student_Name']);}); });
                      print("Data Displayed");
                    },
                  ),
                ),
              ],)
            ],
      ))))));
    }
  }


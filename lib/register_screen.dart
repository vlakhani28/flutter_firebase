import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'GOOGFB.dart';
import 'add_display.dart';
import 'GSignIN.dart';
class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _auth = FirebaseAuth.instance;
  String name;
  String email;
  String password;
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
                  SizedBox(height: 20,),
                  Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(height: 30,),
                  Text("Lets get,",style:kTextStyle),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("you on board",style:kTextStyle),
                  Padding(padding: EdgeInsets.all(5)),
                  SizedBox(height: 50,),
                  TextField(onChanged: (value){name = value;},decoration: InputDecoration(hintText: "Full Name"),),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:InputDecoration(hintText: "Email"),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Register",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                          ),
                          onPressed: () async {
                                 await _auth.createUserWithEmailAndPassword(email: email, password: password);

                                 await _firestore.collection('details').add({
                                  'name': name,
                                  'email': email,
                                });

                                print("Data added");
                                Navigator.pushNamed(context, AddDisplay.id);
                              },
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("--- Or ---",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Buttons_Goog("google.jpg", "  Google  ", (){signInWithGoogle();}),
                      SizedBox(width: 20,),
                      Buttons_Goog("facebook.png", "  Facebook", (){})
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account"),
                      MaterialButton(child: Text("Sign In",style: TextStyle(color: Colors.blue),textAlign: TextAlign.left),onPressed: (){
                        Navigator.pushNamed(context, LoginScreen.id);
                      }),
                    ],
                  ),
                ],
              ),
            )
            ,),
        ),
      ),
    );
  }
}

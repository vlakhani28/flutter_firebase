import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgotPassword extends StatefulWidget {
  static const String id = 'forget_screen';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;
  String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50,),
          Text("Forgot Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            decoration:InputDecoration(hintText: "Email"),
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
          try {
            final newUser = await _auth.sendPasswordResetEmail(
              email: email,);
            print("Password Reset Link sent");
          }
          catch(e)
          {print("Enter Correct email");}
        }
    ))],
      ),
    ])
    );
  }
}

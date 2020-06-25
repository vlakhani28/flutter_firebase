import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship/register_screen.dart';
import 'forgot.dart';
import 'constants.dart';
import 'GOOGFB.dart';
import 'add_display.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

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
                      Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      SizedBox(height: 20,),
                      Text("Welcome back,",style:kTextStyle),
                      Padding(padding: EdgeInsets.all(5)),
                      Text("please login",style:kTextStyle),
                      Padding(padding: EdgeInsets.all(5)),
                      Text("to your account",style: kTextStyle,),
                      SizedBox(height: 50,),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          MaterialButton(child: Text("Forgot Password?",style: TextStyle(color: Colors.blue),textAlign: TextAlign.end),onPressed: (){
                            Navigator.pushNamed(context, ForgotPassword.id);
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Login",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                              ),
                              onPressed: () async {
                                try {
                                  final user = await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                                  if (user != null) {
                                    print("Logged IN");
                                    Navigator.pushNamed(context, AddDisplay.id);
                                  }
                                } catch (e) {
                                  print(e);
                                }
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
                      Buttons_Goog("google.jpg", "  Google  ", (){}),
                      SizedBox(width: 20,),
                      Buttons_Goog("facebook.png", "  Facebook", (){})
                    ],
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Dont have an account?"),
                          MaterialButton(child: Text("Sign Up",style: TextStyle(color: Colors.blue),textAlign: TextAlign.left),onPressed: (){
                            Navigator.pushNamed(context, RegisterScreen.id);
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

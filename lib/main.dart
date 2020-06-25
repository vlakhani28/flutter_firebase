import 'package:flutter/material.dart';
import 'package:internship/register_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'forgot.dart';
import 'add_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RegisterScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
        AddDisplay.id: (context) => AddDisplay(),
      },
    );
  }
}

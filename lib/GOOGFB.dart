import 'package:flutter/material.dart';
class Buttons_Goog extends StatelessWidget {
  Buttons_Goog(this.text,this.displaytext,this.onPressed);
  final String text;
  final Function onPressed;
  final String displaytext;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 30,
      height: 30,
      color: Colors.white,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero,side: BorderSide(color: Colors.grey.shade100)),
      child:
      Container(
        height: 30,
        child: Row(children: <Widget>[
          Image.asset("images/$text",fit: BoxFit.fitHeight,),
          Text("$displaytext"),
        ],),
      ),
      onPressed: onPressed,
    );
  }
}

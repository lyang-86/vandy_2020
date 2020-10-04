import 'package:flutter/material.dart';
import 'global.dart' as globals;
import 'userinput.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: FrontPage(),
    );
  }
}
class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: new Center(
          child: Text("Home Screen"),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                  'Welcome Back, Username!',
                      textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                  ),
              ),
            ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Total Expenses = ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
            ),
          ),
        )
          ],
        ),

      ),
    );
  }
}

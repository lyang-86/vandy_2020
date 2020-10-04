import 'package:flutter/material.dart';
import 'global.dart' as globals;

void main() {
  runApp(new TileApp());
}

class TileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = new TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Enter amount"),
              content: TextField(
                controller: customController,
                keyboardType: TextInputType.number,
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context).pop(customController.text.toString());
                  },
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Center(
            child: Text('ExpansionTile App'),
          ),
        ),

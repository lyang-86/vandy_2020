import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vandyhacks2020/pie.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(new TileApp());
  }

class TileApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: TestPage(),
    );
  }
}
class TestPage extends StatelessWidget {

  createAlertDialog(BuildContext context) {
    TextEditingController customController = new TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
          title: Text("Enter amount"),
          content: TextField(
            controller: customController,
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Submit'),
              onPressed: () {},
            )
          ]
      );
    }
    );
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
        body: new ExpansionTile(
          title: new Text('Expenses', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
          ),
          children: [
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Rent', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: ()  {createAlertDialog(context);},
              selected: true,
              title: new Text('Utility', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Subscriptions', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: ()  {createAlertDialog(context);},
              selected: true,
              title: new Text('Bills', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Savings', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Food', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Clothes', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Electronics', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context);},
              selected: true,
              title: new Text('Other', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
          ],

      ),
    );
  }
}
class UserInput {

  static const defaultExpenses = {'Rent': 0.0, 'Utility': 0.0, 'Subscriptions': 0.0, 'Bills': 0.0, 'Savings': 0.0, 'Food': 0.0, 'Clothes': 0.0, 'Electronics': 0.0, 'Other': 0.0};
  var expenses = defaultExpenses;
  var income;
  var lastWeeksExpenses = defaultExpenses;

  UserInput(List income){
    this.income = income;
  }

  void clearExpense(String expense){
    if (expenses.containsKey(expense)) {
      expenses[expense] = 0;
    }
    else
      print("Expense doesn't exist");
  }

  void changeExpense(String expense, double changedValue){
    if(expenses.containsKey(expense)){
      expenses[expense] = changedValue;
    }
  }

  void addIncome(double amountEarned, {String income = 'Bi-Weekly'}){
    if(income == 'Bi-Weekly'){
      this.income.add(amountEarned*2);
    }
    else if(income == 'Weekly'){
      this.income.add(amountEarned*4);
    }
    else if(income == 'Monthly'){
      this.income.add(amountEarned);
    }
    else if(income == 'Misc'){
      this.income.add(amountEarned);
    }
  }

  void resetIncome(){
    income = new List();
  }

  Map getExpenses(){
    return(expenses);
  }
}

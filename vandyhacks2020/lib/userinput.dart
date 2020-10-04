import 'dart:math';
import 'pie.dart';
import 'package:flutter/material.dart';
import 'global.dart' as globals;
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

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = new TextEditingController();

    return showDialog(context: context, builder: (context) {
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
            child: Text('Configure Income or Expense'),
          ),
        ),
        body: new ListView(
          children: [
        ExpansionTile(
          title: new Text('Expenses', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
          ),
          children: [
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Rent', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Rent', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: ()  {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Utility', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Utility', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Subscriptions', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Subscriptions', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: ()  {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Bills', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Bills', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Savings', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Savings', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Food', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Food', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Clothes', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Clothes', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Electronics', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Electronics', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.changeExpense('Other', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Other', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
          ],

      ),
        ExpansionTile(
        title: new Text('Income', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
        ),
        children: [
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.addIncome('Monthly', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Monthly', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: ()  {createAlertDialog(context).then((onValue){
                globals.user.addIncome('Bi-Weekly', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Bi-Weekly', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: () {createAlertDialog(context).then((onValue){
                globals.user.addIncome('Weekly', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Weekly', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ListTile(
              dense: true,
              enabled: true,
              isThreeLine: false,
              onTap: ()  {createAlertDialog(context).then((onValue){
                globals.user.addIncome('Misc', double.parse(onValue));
              });},
              selected: true,
              title: new Text('Misc', style: TextStyle(fontSize: 20, color:Colors.black)),
            ),
            ],

        ),
    ]));
  }
}
class UserInput {

  static const defaultExpenses = {'Rent': 10.0, 'Utility': 10.0, 'Subscriptions': 10.0, 'Bills': 10.0, 'Savings': 10.0, 'Food': 10.0, 'Clothes': 10.0, 'Electronics': 10.0, 'Other': 10.0};
  static const lastDefaultExpenses = {'Rent': 1.0, 'Utility': 10.0, 'Subscriptions': 1.0, 'Bills': 1.0, 'Savings': 10.0, 'Food': 10.0, 'Clothes': 10.0, 'Electronics': 1.0, 'Other': 1.0};
  var expenses;
  var income;
  var lastWeeksExpenses = lastDefaultExpenses;

  UserInput(List income, Map <String,double>expenses){
    this.income = income;
    this.expenses = expenses;
  }

  void clearExpense(String expense){
    if (expenses.containsKey(expense)) {
      expenses[expense] = 0;
    }
    else
      print("Expense doesn't exist");
  }

  void changeExpense(String expense, double changedValue){
      print(expenses);
      expenses[expense] = changedValue;
      print(expenses);

  }

  void addIncome(String incomeType, double amountEarned){
    if(income == 'Bi-Weekly'){
      this.income.add(amountEarned*2);
    }
    else if(income == 'Weekly'){
      this.income.add(amountEarned*4);
    }
    else if(income == 'Monthly'){
      this.income.add(amountEarned);
    }
    else{
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

import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vandyhacks2020/pie.dart';

void main() {
  runApp(new TileApp());
/*
    title: "User Input Button",

    home: Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Add Input/Expenses'),
        backgroundColor: Colors.black12,
      ),
      body: ExpansionTile(
        title: Text('Add Expenses'),
        children: <Widget>[
          Text('Rent')
        ],
      ),
    ),
  ));
*/
}


class TileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: Text('ExpansionTile App'),
          ),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new StuffInTiles(listOfTiles[index]);
          },
          itemCount: listOfTiles.length,
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          selected: true,
          title: new Text(t.title, style: TextStyle(fontSize: 20,color:Colors.black),));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(t.title, style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Add Expenses',
    <MyTile>[
      new MyTile('Rent'),
      new MyTile('Utility'),
      new MyTile('Subscriptions'),
      new MyTile('Bills'),
      new MyTile('Savings'),
      new MyTile('Other'),
    ],
  ),
  new MyTile(
    'Add Income',
    <MyTile>[
      new MyTile('Weekly'),
      new MyTile('Bi-Weekly'),
      new MyTile('Monthly'),
      new MyTile('Misc.'),
    ],
  ),
];


class UserInput {

  static const defaultExpenses = {'Rent': 0.0, 'Utility': 0.0, 'Subscriptions': 0.0, 'Bills': 0.0, 'Savings': 0.0, 'Other': 0.0};
  var expenses = defaultExpenses;
  var income;

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

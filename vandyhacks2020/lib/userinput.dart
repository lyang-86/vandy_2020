import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vandyhacks2020/pie.dart';

void main() {
  runApp(MaterialApp(

    title: "User Input Button",

    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black45,
        tooltip: 'Add Expense/Income',
      ),
    ),
  ));
}

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

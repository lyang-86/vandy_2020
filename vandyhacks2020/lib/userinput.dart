import 'dart:math';

void main() {

}

class UserInput {
  var expenses = {'Rent': 0.0, 'Utility': 0.0, 'Subscriptions': 0.0, 'Phone': 0.0, 'Savings': 0.0};
  var income = new List();

  void addExpense(String expense,double amountExpended){
    if(!expenses.containsKey(expense)){
      expenses[expense] = amountExpended;
    }
    else{
      print("Expense already exists");
    }

  }
  void removeExpense(String expense){
    if (expenses.containsKey(expense)) {
        expenses.remove(expense);
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
        this.income.add(amountEarned);
      }
      else if(income == 'Weekly'){
        this.income.add(amountEarned*2);
      }
      else if(income == 'Monthly'){
        this.income.add(amountEarned/2);
      }
      else if(income == 'Misc'){
        this.income.add(amountEarned);
      }
  }
  void resetIncome(){
    var income = new List();
  }
}
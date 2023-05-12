import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/hive_database.dart';
import 'package:flutter/widgets.dart';

class TransactionData extends ChangeNotifier {
  //list off all transactions

  List<TransactionItem> overallTransactionList = [];
  //get transaction list
  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallTransactionList = db.readData();
    }
  }

  List<TransactionItem> getAllTransactionList() {
    return overallTransactionList;
  }

  //add new transaction
  void addNewTransaction(TransactionItem newTransaction) {
    overallTransactionList.add(newTransaction);
    notifyListeners();
    db.saveData(overallTransactionList);
  }

  //delete transaction
  void deleteTransaction(TransactionItem newTransaction) {
    overallTransactionList.remove(newTransaction);
    notifyListeners();
    db.saveData(overallTransactionList);
  }

  //day to day name
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

// getting the start of the week day
  DateTime startofweekdate() {
    DateTime? startofweek;
    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startofweek = today.subtract(Duration(days: i));
      }
    }
    return startofweek!;
  }

  Map<String, double> calculateDailyExpense() {
    Map<String, double> dailyExpense = {};
    for (var expense in overallTransactionList) {
      String date = convertDateTime(expense.dateTime);
      double amount = double.parse(expense.amount);
      if (dailyExpense.containsKey(date)) {
        double currentAmount = dailyExpense[date]!;
        currentAmount += amount;
        dailyExpense[date] = currentAmount;
      } else {
        dailyExpense.addAll({date: amount});
      }
    }
    return dailyExpense;
  }
}

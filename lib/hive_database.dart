import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'expense.dart';

class HiveDataBase {
  final _myBox = Hive.box("expense_tracker");

  void saveData(List<TransactionItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.amount,
        expense.dateTime,
        expense.transaction_name
      ];
      allExpenseFormatted.add(expenseFormatted);
    }
    _myBox.put("all_expenses", allExpenseFormatted);
  }

  List<TransactionItem> readData() {
    List savedExpenses = _myBox.get("expense_tracker") ?? [];
    List<TransactionItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String amount = savedExpenses[i][0];
      DateTime dateTime = savedExpenses[i][1];
      String transaction_name = savedExpenses[i][2];

      TransactionItem expense = TransactionItem(
          transaction_name: transaction_name,
          amount: amount,
          dateTime: dateTime);
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}

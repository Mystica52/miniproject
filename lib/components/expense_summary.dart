import 'package:expense_tracker/bargraph/bargraph.dart';
import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:expense_tracker/expense_data.dart';
import 'package:expense_tracker/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfweek;
  final _weeklySummary = TextEditingController();
  late String balance;
  ExpenseSummary({super.key, required this.startOfweek});

  double Max(
      TransactionData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpense()[sunday] ?? 0,
      value.calculateDailyExpense()[monday] ?? 0,
      value.calculateDailyExpense()[tuesday] ?? 0,
      value.calculateDailyExpense()[wednesday] ?? 0,
      value.calculateDailyExpense()[thursday] ?? 0,
      value.calculateDailyExpense()[friday] ?? 0,
      value.calculateDailyExpense()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.3;
    return max == 0 ? 100 : max;
  }

  String weeklySummary(
      TransactionData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    List<double> values = [
      value.calculateDailyExpense()[sunday] ?? 0,
      value.calculateDailyExpense()[monday] ?? 0,
      value.calculateDailyExpense()[tuesday] ?? 0,
      value.calculateDailyExpense()[wednesday] ?? 0,
      value.calculateDailyExpense()[thursday] ?? 0,
      value.calculateDailyExpense()[friday] ?? 0,
      value.calculateDailyExpense()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTime(startOfweek.add(const Duration(days: 0)));
    String monday = convertDateTime(startOfweek.add(const Duration(days: 1)));
    String tuesday = convertDateTime(startOfweek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTime(startOfweek.add(const Duration(days: 3)));
    String thursday = convertDateTime(startOfweek.add(const Duration(days: 4)));
    String friday = convertDateTime(startOfweek.add(const Duration(days: 5)));
    String saturday = convertDateTime(startOfweek.add(const Duration(days: 6)));

    return Consumer<TransactionData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: Bargraph(
          maxY: Max(value, sunday, monday, tuesday, wednesday, thursday, friday,
              saturday),
          sunAmount: value.calculateDailyExpense()[sunday] ?? 0,
          monAmount: value.calculateDailyExpense()[monday] ?? 0,
          tueAmount: value.calculateDailyExpense()[tuesday] ?? 0,
          wedAmount: value.calculateDailyExpense()[wednesday] ?? 0,
          thurAmount: value.calculateDailyExpense()[thursday] ?? 0,
          friAmount: value.calculateDailyExpense()[friday] ?? 0,
          satAmount: value.calculateDailyExpense()[saturday] ?? 0,
          weeklyAmount: weeklySummary(value, sunday, monday, tuesday, wednesday,
              thursday, friday, saturday),
        ),
      ),
    );
  }
}

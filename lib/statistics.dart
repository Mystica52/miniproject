import 'package:expense_tracker/components/expense_summary.dart';
import 'package:expense_tracker/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Weekly Summary',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ExpenseSummary(startOfweek: value.startofweekdate()),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class transact extends StatelessWidget {
  final String transaction_name;
  final String amount;
  final String expense_or_income;

  transact(
      {required this.transaction_name,
      required this.amount,
      required this.expense_or_income});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        height: 50,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(transaction_name),
            Text(
              (expense_or_income == 'expense' ? '-' : '+') + amount + ' Rwf',
              style: TextStyle(
                  color: (expense_or_income == 'expense'
                      ? Colors.red
                      : Colors.green)),
            ),
          ],
        )),
      ),
    );
  }
}

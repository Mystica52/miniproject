import 'package:expense_tracker/total.dart';
import 'package:flutter/material.dart';

class topcard extends StatelessWidget {
  final String balance;
  topcard({
    required this.balance,
  });
  void tot() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('T O T A L    E X P E N S E',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16)),
              Text(
                balance + ' Rwf',
                style: TextStyle(color: Colors.grey[800], fontSize: 40),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
      ),
    );
  }
}

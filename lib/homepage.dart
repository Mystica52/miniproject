import 'package:expense_tracker/bargraph/bargraph.dart';
import 'package:expense_tracker/button.dart';
import 'package:expense_tracker/components/transaction_tile.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_data.dart';
import 'package:expense_tracker/top.dart';
import 'package:expense_tracker/total.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/navbar.dart';
import 'package:provider/provider.dart';

import 'notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Provider.of<TransactionData>(context, listen: false).prepareData();
  }

  void save() {
    TransactionItem newTransaction = TransactionItem(
      transaction_name: _textcontrollerITEM.text,
      amount: _textcontrollerAMOUNT.text,
      dateTime: DateTime.now(),
    );
    Provider.of<TransactionData>(context, listen: false)
        .addNewTransaction(newTransaction);

    Navigator.of(context).pop();
    clear();
  }

  void clear() {
    _textcontrollerAMOUNT.clear();
    _textcontrollerITEM.clear();
  }

  void _addtrans() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('N E W  T R A N S A C T I O N'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount?',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: _textcontrollerAMOUNT,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'For what?',
                              ),
                              controller: _textcontrollerITEM,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.grey[600],
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child: Text('Enter', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      save();
                      tut(totalWeeklyAmount);
                      await NotificationService().showNotification(
                          title: 'Expense tracker',
                          body: 'New transaction added');
                    },
                  )
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Expense Tracker',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
                backgroundColor: Colors.black,
              ),
              backgroundColor: Colors.grey[300],
              drawer: navbar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    topcard(balance: totalWeeklyAmount),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: value.getAllTransactionList().length,
                          itemBuilder: (context, index) => TransactionTile(
                              name: value
                                  .getAllTransactionList()[index]
                                  .transaction_name,
                              amount:
                                  value.getAllTransactionList()[index].amount,
                              dateTime: value
                                  .getAllTransactionList()[index]
                                  .dateTime)),
                    ),
                    button(function: _addtrans)
                  ],
                ),
              ),
            ));
  }
}

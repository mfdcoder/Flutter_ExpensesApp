import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './add_transaction.dart';
import './transaction_list.dart';
import './../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Grocery',
      amount: 35.55,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Mall',
      amount: 25.55,
      date: DateTime.now().add(new Duration(days: 10)),
    ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    //  Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

  ];

  void _addTransaction(String txTitle, double txAmount) {
    var newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(_addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}

import 'package:MyExpenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions yet', style: Theme.of(context).textTheme.headline5,),
                SizedBox(height:20,),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.contain),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.redAccent,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(5, 15)),
                      ),
                      child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Container(
                            child: Text(
                              // DateFormat('dd-MMM-yyyy').format(transactions[index].date),
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
              }),
    );
  }
}

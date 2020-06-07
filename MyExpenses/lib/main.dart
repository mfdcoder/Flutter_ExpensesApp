import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/add_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.deepOrangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.dark().textTheme.copyWith(
            headline6 : TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              color: Colors.orange
            ),
            headline4 : TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ), 
            overline :TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 10,
            ), 
          ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline4 : TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
            )
          )
        )

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),

    // Transaction(
    //   id: 't1',
    //   title: 'Mall',
    //   amount: 25.55,
    //   date: DateTime.now().add(new Duration(days: 10)),
    // ),
    

  ];


  void _addTransaction(String txTitle, double txAmount) {
    print('_addTransaction');
    var newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });

  }

void showAddModal(BuildContext ctx) {
  showModalBottomSheet(context: ctx, builder: (_) {
    return AddTransaction(_addTransaction);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses', style: Theme.of(context).appBarTheme.textTheme.headline4,),
      
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
               showAddModal(context);
              },
            ),
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart'),
                  color: Colors.blue,
                ),
              ),
              TransactionList(_userTransactions),
            ]),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          onPressed: () {
            showAddModal(context);
          },
        ));
  }
}

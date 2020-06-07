import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTranscation;

  AddTransaction(this.addTranscation);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void _onSubmit() {
    print('onSubmit');
    final String title = titleController.text;
    final double amt = double.parse(amountController.text);

    print('onSubmit $title - $amt');
    if (title.isNotEmpty && amt > 0 && selectedDate != null) {
      widget.addTranscation(title, amt);
    }
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) => {
              setState(() {
                if (value != null) {selectedDate = value;}
              })
              
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                // style: Theme.of(context).textTheme.headline6,
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    contentPadding: const EdgeInsets.all(5),
                    hintText: 'you spent on...'),
                onSubmitted: (_) => _onSubmit(),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'how much did you spend...',
                  contentPadding: const EdgeInsets.all(5),
                ),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                onSubmitted: (_) => _onSubmit(),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                child: Row(children: <Widget>[
                  Text(
                    selectedDate == null ? "No date added" : DateFormat.yMMMd().format(selectedDate) ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Select Date',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: _openDatePicker,
                  )
                ]),
              ),
              RaisedButton(
                onPressed: _onSubmit,
                child: Text('Add Transaction'),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

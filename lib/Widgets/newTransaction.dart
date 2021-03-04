import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrans;

  NewTransaction(this.addTrans);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final costController = TextEditingController();
  final priceController = TextEditingController();
  final timeController = TextEditingController();
  final descriptionController = TextEditingController();

  void submitData() {
    final enteredExpenseItem = titleController.text;
    final enteredAmount = double.parse(costController.text);
    if (enteredExpenseItem.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addTrans(
        enteredExpenseItem,
        enteredAmount,
      );
      Navigator.of(context).pop();
    }
  }

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          child: Text(
            "KYGM Services",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Service Name'),
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(labelText: 'dd/mm/yyyy'),
                      keyboardType: TextInputType.datetime,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: costController,
                      decoration: InputDecoration(labelText: 'Cost'),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: timeController,
                      decoration: InputDecoration(labelText: '3 hrs'),
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'a man'),
                      keyboardType: TextInputType.multiline,
                      onSubmitted: (_) => submitData(),
                    ),
                    //use dropdown selector for service, purchase, or sale
                    ElevatedButton(
                      onPressed: submitData,
                      child: Text('Add Transaction'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

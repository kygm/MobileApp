import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final fNameCon = TextEditingController();
  final lNameCon = TextEditingController();
  final addressCon = TextEditingController();
  final cityCon = TextEditingController();
  final stateCon = TextEditingController(); //use select list, include mex/can
  final descriptCon = TextEditingController();
  final phoneNumCon = TextEditingController();

  DateTime _selectedDate;
  void submitData() {
    final enteredExpenseItem = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredExpenseItem.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addTx(
        enteredExpenseItem,
        enteredAmount,
      );
      Navigator.of(context).pop();
    }
  }

  void _doDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    // return DropdownButton<String>(
    //   value: dropdownValue,
    //   icon: Icon(Icons.arrow_downward),
    //   iconSize: 24,
    //   elevation: 16,
    //   style: TextStyle(color: Colors.deepPurple),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.deepPurpleAccent,
    //   ),
    //   onChanged: (String newValue) {
    //     setState(() {
    //       dropdownValue = newValue;
    //     });
    //   },
    //   items: <String>['One', 'Two', 'Free', 'Four']
    //       .map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Text(value),
    //     );
    //   }).toList(),
    // );
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Expense Item'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: fNameCon,
              decoration: InputDecoration(labelText: 'First: '),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: lNameCon,
              decoration: InputDecoration(labelText: 'Last: '),
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: [
                TextField(
                  controller: addressCon,
                  decoration: InputDecoration(labelText: 'Address: '),
                  keyboardType: TextInputType.streetAddress,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  controller: cityCon,
                  decoration: InputDecoration(labelText: 'City: '),
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  controller: stateCon,
                  decoration: InputDecoration(labelText: 'State: '),
                  onSubmitted: (_) => submitData(),
                ), // use a select menu?
              ],
            ),
            TextField(
              controller: phoneNumCon,
              decoration: InputDecoration(labelText: 'Phone Number: '),
              keyboardType: TextInputType.phone,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: descriptCon,
              decoration: InputDecoration(labelText: 'Description: '),
              onSubmitted: (_) => submitData(),
            ),
            //use dropdown selector for service, purchase, or sale
            FlatButton(
              onPressed: submitData,
              child: Text('Add Item'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}

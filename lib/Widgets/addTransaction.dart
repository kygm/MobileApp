import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../main.dart';

class AddTransaction extends StatefulWidget {
  final Function addTrans;

  AddTransaction(this.addTrans);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final costController = TextEditingController();
  final priceController = TextEditingController();
  final timeController = TextEditingController();
  final descriptionController = TextEditingController();

  void submitData() {
    final inTitle = titleController.text;
    final inDate = dateController.text;
    final inCost = double.parse(costController.text);
    final inPrice = double.parse(priceController.text);
    final inTime = timeController.text;
    final inDes = descriptionController.text;
    final inEntered = DateTime.now();
    if (inTitle.isEmpty || inCost <= 0) {
      return;
    } else {
      widget.addTrans(
          inTitle, inDate, inCost, inPrice, inTime, inDes, inEntered);
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
                      decoration: InputDecoration(labelText: 'Service Name:'),
                      onSubmitted: (_) => submitData(),
                    ),
                    // DateTimeField(
                    //   format: DateFormat('dd-MM-yyyy'),
                    //   onShowPicker: (context, currentValue) async {
                    //     final date = await showDatePicker(
                    //         context: context,
                    //         firstDate: DateTime(1900),
                    //         initialDate: currentValue ?? DateTime.now(),
                    //         lastDate: DateTime(2100));
                    //     if (date != null) {
                    //       final time = await showTimePicker(
                    //         context: context,
                    //         initialTime: TimeOfDay.fromDateTime(
                    //             currentValue ?? DateTime.now()),
                    //       );
                    //       return DateTimeField.combine(date, time);
                    //     } else {
                    //       return currentValue;
                    //     }
                    //   },
                    // ),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(labelText: 'Service Date:'),
                      keyboardType: TextInputType.datetime,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: costController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'Cost:'),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: priceController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'Price:'),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: timeController,
                      decoration: InputDecoration(labelText: 'Duration:'),
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description:'),
                      keyboardType: TextInputType.multiline,
                      onSubmitted: (_) => submitData(),
                    ),
                    //use dropdown selector for service, purchase, or sale
                    Center(
                      child: RaisedButton(
                        onPressed: submitData,
                        child: Text('Add Transaction'),
                      ),
                    ),
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

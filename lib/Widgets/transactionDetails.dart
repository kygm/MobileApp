import 'package:KYGM_Mobile/Widgets/viewTransactions.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class TransactionDetails extends StatefulWidget {
  final String id, fname, lname, title, date, time, description;
  final int cost, price;
  TransactionDetails(this.id, this.fname, this.lname, this.title, this.date,
      this.time, this.description, this.cost, this.price);
  final ClientsApi api = ClientsApi();
  @override
  _TransactionDetailsState createState() => _TransactionDetailsState(
      id, fname, lname, title, date, time, description, cost, price);
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final String id, fname, lname, title, date, time, description;
  final int cost, price;
  _TransactionDetailsState(this.id, this.fname, this.lname, this.title,
      this.date, this.time, this.description, this.cost, this.price);
  final titleCon = TextEditingController(),
      dateCon = TextEditingController(),
      costCon = TextEditingController(),
      priceCon = TextEditingController(),
      timeCon = TextEditingController(),
      descriptionCon = TextEditingController();
  var c1 = Colors.lightBlue;
  bool editStatus = false;
  void editStateChange() {
    if (editStatus == false) {
      setState(() => editStatus = true);
    } else if (editStatus == true) {
      setState(() => editStatus = false);
    }
  }

  submitData() {
    final inTitle = titleCon.text;
    final inDate = dateCon.text;
    final inCost = double.parse(costCon.text);
    final inPrice = double.parse(priceCon.text);
    final inTime = timeCon.text;
    final inDes = descriptionCon.text;
    final inEntered = DateTime.now();
    if (inTitle.isEmpty ||
        inDate.isEmpty ||
        inPrice == null ||
        inCost == null ||
        inDes.isEmpty) {
      return;
    } else {
      String fname, lname, phoneNumber, transactDate, transactTime, descript;
      var transactCost, transactPrice;
      widget.api.createTransaction(fname, lname, phoneNumber, inDate, inTime,
          inDes, inTitle, inCost, inPrice);
      Navigator.of(context).pop();
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: TextButton(
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
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Expanded(
                        child: SizedBox(
                          height: 1000,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView(
                              children: <Widget>[
                                Text("Name: " +
                                    fname.toString() +
                                    " " +
                                    lname.toString()),
                                ColoredBox(
                                    color: c1,
                                    child: Text("Title: " + title.toString())),
                                ColoredBox(
                                  color: c1,
                                  child: Text("Date: " + date.toString()),
                                ),
                                ColoredBox(
                                  color: c1,
                                  child: Text("Time: " + time.toString()),
                                ),
                                ColoredBox(
                                  color: c1,
                                  child: Text("Cost: " + cost.toString()),
                                ),
                                ColoredBox(
                                  color: c1,
                                  child: Text("Price: " + price.toString()),
                                ),
                                ColoredBox(
                                  color: c1,
                                  child: Text(
                                      "Description: " + description.toString()),
                                ),
                                TextButton(
                                  onPressed: editStateChange,
                                  child: Text('Edit Transaction',
                                      style: TextStyle(color: Colors.black)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.yellow)),
                                ),
                                TextButton(
                                  // enabled:editStatus,
                                  onPressed: null,
                                  child: Text('Save Transaction',
                                      style: TextStyle(color: Colors.black)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue)),
                                ),
                                TextButton(
                                  child: Text(
                                    'Back To Transactions',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.lightGreen)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewTransacts()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

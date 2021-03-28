import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import '../api.dart';
import './drawer.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../main.dart';

class AddTransaction extends StatefulWidget {
  //final Function addTrans;
  final String phoneNumber;
  final String fname;
  final String lname;
  final String id;

  AddTransaction(this.id, this.fname, this.lname, this.phoneNumber);

  final ClientsApi api = ClientsApi();
  @override
  _AddTransactionState createState() => _AddTransactionState(id, fname, lname, phoneNumber);
}

class _AddTransactionState extends State<AddTransaction> {

  final String id, phoneNumber, fname, lname;

  _AddTransactionState(this.id, this.fname, this.lname, this.phoneNumber);


  final titleCon = TextEditingController();
  final dateCon = TextEditingController();
  final costCon = TextEditingController();
  final priceCon = TextEditingController();
  final timeCon = TextEditingController();
  final descriptionCon = TextEditingController();

  void initState() {
    super.initState();
    //print(3);
    final s = widget.api.testApi();
    //print(s.toString());
    //
    //print(s);
    //print("test");

    widget.api.getClients().then((data) {
      setState(() {
        //clients = data;
        //print(clients);
        //loading = false;
      });
    });

    //print(3);
  }

  void submitData() {
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
      //String fname, lname, phoneNumber, transactDate, transactTime, descript;
      //var transactCost, transactPrice;


      widget.api.createTransaction(
          fname, lname, phoneNumber, inDate, inTime, inTitle, inDes, inCost, inPrice);
       //print(fname+ lname+ phoneNumber+inDate+ inTime+ inTitle+ inDes+ inCost.toString() +inPrice.toString());
      Navigator.of(context).pop();
    }
    Navigator.of(context).pop();
  }

  String dropdownValue = 'One';
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
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(""),

                        TextFormField(
                          controller: titleCon,
                          decoration: InputDecoration(labelText: 'Service Name:'),
                          onFieldSubmitted: (_) => submitData(),
                        ),
                        TextFormField(
                          controller: dateCon,
                          decoration: InputDecoration(labelText: 'Service Date:'),
                          keyboardType: TextInputType.datetime,
                          onFieldSubmitted: (_) => submitData(),
                        ),
                        TextFormField(
                          controller: costCon,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(labelText: 'Cost:'),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (_) => submitData(),
                        ),
                        TextFormField(
                          controller: priceCon,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(labelText: 'Price:'),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (_) => submitData(),
                        ),
                        TextFormField(
                          controller: timeCon,
                          decoration: InputDecoration(labelText: 'Duration:'),
                          onFieldSubmitted: (_) => submitData(),
                        ),
                        TextFormField(
                          controller: descriptionCon,
                          decoration: InputDecoration(labelText: 'Description:'),
                          keyboardType: TextInputType.multiline,
                          onFieldSubmitted: (_) => submitData(),
                        ),
                        //use dropdown selector for service, purchase, or sale
                        Center(
                          child: ElevatedButton(
                            onPressed: () => submitData(),
                            child: Text('Add Transaction'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

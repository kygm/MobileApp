import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/client.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';
import './viewClients.dart';
import './addTransaction.dart';

class ClientDetails extends StatefulWidget {
  final String id, fname, lname, city, address, state, phoneNumber;
  ClientDetails(this.id, this.fname, this.lname, this.city, this.address,
      this.state, this.phoneNumber);
  final ClientsApi api = ClientsApi();
  @override
  _ClientDetailsState createState() =>
      _ClientDetailsState(id, fname, lname, city, address, state, phoneNumber);
}

class _ClientDetailsState extends State<ClientDetails> {
  final String id, fname, lname, city, address, state, phoneNumber;
  _ClientDetailsState(this.id, this.fname, this.lname, this.city, this.address,
      this.state, this.phoneNumber);
  final fNameCon = TextEditingController(),
      lNameCon = TextEditingController(),
      addressCon = TextEditingController(),
      cityCon = TextEditingController(),
      stateCon = TextEditingController(),
      descriptCon = TextEditingController(),
      phoneNumCon = TextEditingController();
  DateTime _selectedDate;
  var c1 = Colors.lightBlue;
  bool editStatus = false;
  void editStateChange() {
    if (editStatus == false) {
      setState(() => editStatus = true);
    } else if (editStatus == true) {
      setState(() => editStatus = false);
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

  submitData() {
    final inFName = fNameCon.text;
    final inLName = lNameCon.text;
    final inAddress = addressCon.text;
    final inCity = cityCon.text;
    String inState = stateCon.text;
    final inDes = descriptCon.text;
    final inPhoneNum = int.parse(phoneNumCon.text);
    setState(() {
      widget.api.createClient(inFName, inLName, inAddress, inCity, inState,
          inPhoneNum.toString(), inDes);
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      );
      Navigator.of(context).pop();
    });
    //List<String> states = new List();
    inState.length == 2 ? inState.toUpperCase() : inState.toLowerCase();
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
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        controller: fNameCon,
                                        decoration: InputDecoration(
                                            prefixText: "First Name: ",
                                            labelText: fname),
                                        style: TextStyle(fontSize: 20))),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        controller: lNameCon,
                                        decoration: InputDecoration(
                                            prefixText: "Last Name: ",
                                            labelText: lname),
                                        style: TextStyle(fontSize: 20))),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        controller: cityCon,
                                        decoration: InputDecoration(
                                            prefixText: "City Name: ",
                                            labelText: city),
                                        style: TextStyle(fontSize: 20))),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        controller: stateCon,
                                        decoration: InputDecoration(
                                            prefixText: "State: ",
                                            labelText: state),
                                        style: TextStyle(fontSize: 20))),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                  child: TextField(
                                    controller: addressCon,
                                    decoration: InputDecoration(
                                        prefixText: "Address:",
                                        labelText: address),
                                    keyboardType: TextInputType.streetAddress,
                                    style: TextStyle(fontSize: 20),
                                    readOnly: editStatus,
                                  ),
                                ),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                  child: TextField(
                                    controller: phoneNumCon,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11)
                                    ],
                                    decoration: InputDecoration(
                                        prefixText: "Phone Number: ",
                                        labelText: phoneNumber),
                                    style: TextStyle(fontSize: 20),
                                    keyboardType: TextInputType.phone,
                                    readOnly: editStatus,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: editStateChange,
                                child: Text('Edit Client',
                                    style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.yellow)),
                              ),
                              TextButton(
                                onPressed:
                                    editStatus == true ? submitData() : null,
                                child: Text('Save Client',
                                    style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue)),
                              ),
                              TextButton(
                                child: Text(
                                  'Add New Transaction',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green)),
                                onPressed: () {
                                  editStatus == true
                                      ? null
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddTransaction(id, fname,
                                                      lname, phoneNumber)),
                                        );
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Back To Clients',
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
                                        builder: (context) => ViewClients()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

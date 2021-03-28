import 'package:flutter/cupertino.dart';
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
  var c1 = Colors.grey;
  bool editStatus = true;
  void editStateChange() {
    // if (editStatus == true) {
    //   setState(() => editStatus = false);
    // } else if (editStatus == false) {
    //   setState(() => editStatus = true);
    // }
  }

  void _doDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      // setState(() {
      //   _selectedDate = pickedDate;
      // });
    });
  }

  submitData() {
    var inFName = fNameCon.text;
    var inLName = lNameCon.text;
    var inAddress = addressCon.text;
    var inCity = cityCon.text;
    String inState = stateCon.text;
    var inDes = descriptCon.text;
    var inPhoneNum = phoneNumCon.toString();
    setState(() {
      if (inFName != null || inFName == '') {
        inFName = fname;
      }
      if (inLName != null || inLName == '') {
        inLName = lname;
      }
      if (inAddress != null || inAddress == '') {
        inAddress = fname;
      }
      if (inCity != null || inCity == '') {
        inCity = fname;
      }
      if (inState != null || inState == '') {
        inState = fname;
      }
      if (inPhoneNum != null) {
        inPhoneNum = phoneNumber;
      }
      widget.api.editClient(id, inFName, inLName, inAddress, inCity, inState,
          inPhoneNum.toString());
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      );
      Navigator.of(context).pop();
    });
    List<String> states = new List();
    inState.length == 2 ? inState.toUpperCase() : inState.toLowerCase();
    Navigator.of(context).pop();
  }

  void deleteClient(id) {
    print("Deleting Client " + id);
    setState(() {
      widget.api.deleteClient(id);

      MaterialPageRoute(
        builder: (context) => ViewClients(),
      );

      Navigator.pop(context);
    });
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("First Name: " + fname),
                              // Text("Last Name: " + lname),
                              // Text("State: " + state),
                              // Text("Phone Number: " + phoneNumber),
                              // Text("Address: " + address),
                              // Text("City: " + city),
                              Row(
                                children: [
                                  ElevatedButton(
                                      child: Text("Add Transaction"),
                                      onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddTransaction(id, fname,
                                                          lname, phoneNumber)),
                                            ),
                                          }),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
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
                                              builder: (context) =>
                                                  ViewClients()),
                                        );
                                      },
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => {deleteClient(id)},
                                    child: Icon(
                                      Icons.delete,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        enabled:
                                            editStatus == true ? false : true,
                                        readOnly: editStatus,
                                        controller: fNameCon,
                                        decoration: InputDecoration(
                                            prefixText: "First Name: ",
                                            labelText: fname),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        onSubmitted: (_) => submitData())),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        enabled:
                                            editStatus == true ? false : true,
                                        readOnly: editStatus,
                                        controller: lNameCon,
                                        decoration: InputDecoration(
                                            prefixText: "Last Name: ",
                                            labelText: lname),
                                        style: TextStyle(fontSize: 20),
                                        onSubmitted: (_) => submitData())),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        enabled:
                                            editStatus == true ? false : true,
                                        readOnly: editStatus,
                                        controller: cityCon,
                                        decoration: InputDecoration(
                                            prefixText: "City Name: ",
                                            labelText: city),
                                        style: TextStyle(fontSize: 20),
                                        onSubmitted: (_) => submitData())),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: TextField(
                                        enabled:
                                            editStatus == true ? false : true,
                                        readOnly: editStatus,
                                        controller: stateCon,
                                        decoration: InputDecoration(
                                            prefixText: "State: ",
                                            labelText: state),
                                        style: TextStyle(fontSize: 20),
                                        onSubmitted: (_) => submitData())),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                  child: TextField(
                                    enabled: editStatus == true ? false : true,
                                    readOnly: editStatus,
                                    controller: addressCon,
                                    decoration: InputDecoration(
                                        prefixText: "Address:",
                                        labelText: address),
                                    keyboardType: TextInputType.streetAddress,
                                    style: TextStyle(fontSize: 20),
                                    onSubmitted: (_) => submitData(),
                                  ),
                                ),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                  child: TextField(
                                    enabled: editStatus == true ? false : true,
                                    readOnly: editStatus,
                                    controller: phoneNumCon,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11)
                                    ],
                                    decoration: InputDecoration(
                                        prefixText: "Phone Number: ",
                                        labelText: phoneNumber),
                                    style: TextStyle(fontSize: 20),
                                    onSubmitted: (_) => submitData(),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 40, 0),
                                    child: TextButton(
                                      onPressed: editStateChange,
                                      child: Text('Edit Client',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.yellow)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: ElevatedButton(
                                      child: Text('Save Client',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue)),
                                      onPressed: () {
                                        submitData();
                                      },
                                    ),
                                  ),
                                ],
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

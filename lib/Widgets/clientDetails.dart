import 'package:KYGM_Mobile/widgets/mostOfApp.dart';
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
  final String id, fname, lname, address, city, state, phoneNumber, description;
  ClientDetails(this.id, this.fname, this.lname, this.address, this.city,
      this.state, this.phoneNumber, this.description);

  final ClientsApi api = ClientsApi();
  @override
  _ClientDetailsState createState() => _ClientDetailsState(
      id, fname, lname, address, city, state, phoneNumber, description);
}

class _ClientDetailsState extends State<ClientDetails> {
  final String id, fname, lname, address, city, state, phoneNumber, description;
  _ClientDetailsState(this.id, this.fname, this.lname, this.address, this.city,
      this.state, this.phoneNumber, this.description);
  final fNameCon = TextEditingController(),
      lNameCon = TextEditingController(),
      addressCon = TextEditingController(),
      cityCon = TextEditingController(),
      stateCon = TextEditingController(),
      phoneNumCon = TextEditingController(),
      descriptCon = TextEditingController();
  var c1 = Colors.grey;
  bool editStatus = true;
  bool checkState() {
    var inState = stateCon.text.toUpperCase();
    if (inState != "AL" &&
        inState != "AK" &&
        inState != "AZ" &&
        inState != "AR" &&
        inState != "CA" &&
        inState != "CO" &&
        inState != "CT" &&
        inState != "DE" &&
        inState != "FL" &&
        inState != "GA" &&
        inState != "HI" &&
        inState != "ID" &&
        inState != "IL" &&
        inState != "IN" &&
        inState != "IA" &&
        inState != "KS" &&
        inState != "KY" &&
        inState != "LA" &&
        inState != "ME" &&
        inState != "MD" &&
        inState != "MA" &&
        inState != "MI" &&
        inState != "MN" &&
        inState != "MS" &&
        inState != "MO" &&
        inState != "MT" &&
        inState != "NE" &&
        inState != "NV" &&
        inState != "NH" &&
        inState != "NJ" &&
        inState != "NM" &&
        inState != "NY" &&
        inState != "NC" &&
        inState != "ND" &&
        inState != "OH" &&
        inState != "OK" &&
        inState != "OR" &&
        inState != "PA" &&
        inState != "RI" &&
        inState != "SC" &&
        inState != "SD" &&
        inState != "TN" &&
        inState != "TX" &&
        inState != "UT" &&
        inState != "VT" &&
        inState != "VA" &&
        inState != "WA" &&
        inState != "WV" &&
        inState != "WI" &&
        inState != "WY") {
      return false;
    } else {
      return true;
    }
  }

  void editStateChange() {
    if (editStatus == true) {
      setState(() => editStatus = false);
    } else if (editStatus == false) {
      setState(() => editStatus = true);
    }
  }

  submitData() {
    var inFName = fNameCon.text,
        inLName = lNameCon.text,
        inAddress = addressCon.text,
        inCity = cityCon.text,
        inState = stateCon.text.toUpperCase(),
        inPhoneNum = phoneNumCon.text,
        inDes = descriptCon.text;
    if (checkState() == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) => _stateErrorWindow(context),
      );
    } else {
      setState(() {
        if (inFName == null || inFName == "") {
          inFName = fname;
        }
        if (inLName == null || inLName == "") {
          inLName = lname;
        }
        if (inAddress == null || inAddress == "") {
          inAddress = address;
        }
        if (inCity == null || inCity == "") {
          inCity = city;
        }
        if (inState == null || inState == "") {
          inState = state;
        }
        if (inPhoneNum == null || inPhoneNum == "") {
          inPhoneNum = phoneNumber;
        }
        if (inDes == null || inDes == "") {
          inDes = description;
        }
        widget.api.editClient(id, inFName, inLName, inAddress, inCity, inState,
            inPhoneNum, inDes);
        MaterialPageRoute(
          builder: (context) => ViewClients(),
        );
        Navigator.of(context).pop();
      });
      Navigator.of(context).pop();
    }
  }

  void _deleteClient(id) {
    print("Deleting Client " + id);
    setState(() {
      widget.api.deleteClient(id);
      Navigator.pop(context);
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
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
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
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _confirmWindow(context),
                                      );
                                    },
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
                              ColoredBox(
                                color: c1,
                                child: Center(
                                  child: TextField(
                                    enabled: editStatus == true ? false : true,
                                    readOnly: editStatus,
                                    controller: descriptCon,
                                    decoration: InputDecoration(
                                        prefixText: "Description:",
                                        labelText: description),
                                    style: TextStyle(fontSize: 20),
                                    onSubmitted: (_) => submitData(),
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
                                    child: TextButton(
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

  Widget _confirmWindow(BuildContext context) {
    return new AlertDialog(
      title: const Text('Are you sure you want to delete this client?'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Are you sure? This action cannot be undone.'),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  _deleteClient(id.toString());
                },
                child: Text('Yes', style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No', style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                ),
              ),
            ],
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _stateErrorWindow(BuildContext context) {
    return new AlertDialog(
      title: const Text('State Input Error'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Please input the correct 2 letter'),
          Text('abbreviation of the desired state.'),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok', style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
              ),
            ],
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

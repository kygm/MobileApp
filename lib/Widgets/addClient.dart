import 'package:KYGM_Mobile/widgets/viewClients.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:flutter/services.dart';
import './mostOfApp.dart';
import './drawer.dart';
import '../api.dart';

class AddClient extends StatefulWidget {
  final Function addClient;

  AddClient(this.addClient);
  //api declaration
  final ClientsApi api = ClientsApi();
  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final fNameCon = TextEditingController();
  final lNameCon = TextEditingController();
  final addressCon = TextEditingController();
  final cityCon = TextEditingController();
  final stateCon = TextEditingController(); //use select list, include mex/can
  final descriptCon = TextEditingController();
  final phoneNumCon = TextEditingController();

  DateTime _selectedDate;

  void sendToHome() {
    setState(() {
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      );
      Navigator.of(context).pop();
    });
  }

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

  void submitData() {
    final inFName = fNameCon.text;
    final inLName = lNameCon.text;
    final inAddress = addressCon.text;
    final inCity = cityCon.text;
    String inState = stateCon.text.toUpperCase();
    final inDes = descriptCon.text;
    final inPhoneNum = int.parse(phoneNumCon.text);
    if (checkState() == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) => _stateErrorWindow(context),
      );
    } else {
      print(inFName +
          " " +
          inLName +
          " " +
          inAddress +
          " " +
          inCity +
          " " +
          inState +
          " " +
          inDes +
          " " +
          inPhoneNum.toString());

      setState(() {
        widget.api.createClient(inFName, inLName, inAddress, inCity, inState,
            inPhoneNum.toString(), inDes);
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );
        Navigator.of(context).pop();
      });
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
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewClients()));
          },
          child: Text(
            "KYGM Services",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                      controller: fNameCon,
                      decoration: InputDecoration(labelText: 'First Name: '),
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: lNameCon,
                      decoration: InputDecoration(labelText: 'Last Name: '),
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: addressCon,
                      decoration: InputDecoration(
                        labelText: 'Address: ',
                      ),
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
                    TextField(
                      controller: phoneNumCon,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11)
                      ],
                      decoration: InputDecoration(labelText: 'Phone Number: '),
                      keyboardType: TextInputType.phone,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      controller: descriptCon,
                      decoration: InputDecoration(labelText: 'Description: '),
                      keyboardType: TextInputType.multiline,
                      onSubmitted: (_) => submitData(),
                    ),
                    //use dropdown selector for service, purchase, or sale
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: sendToHome,
                          child: Text('Cancel'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                        ),
                        ElevatedButton(
                          onPressed: submitData,
                          child: Text('Add Client'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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

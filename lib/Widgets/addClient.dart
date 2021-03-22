import 'package:KYGM_Mobile/widgets/viewClients.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:flutter/services.dart';
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
  void submitData() {


    final inFName = fNameCon.text;
    final inLName = lNameCon.text;
    final inAddress = addressCon.text;
    final inCity = cityCon.text;
    String inState = stateCon.text;
    final inDes = descriptCon.text;
    final inPhoneNum = int.parse(phoneNumCon.text);

    print(inFName + " "+ inLName + " " + inAddress+ " " + inCity+ " " + inState+ " " + inDes+ " " + inPhoneNum.toString());
    
    setState(() {
        //Flutter2 Lname2 Address2 City2 State3 Descript2 2222222222
      widget.api.createClient(inFName, inLName, inAddress, inCity, inState, inPhoneNum.toString(),inDes);
      MaterialPageRoute(builder: (context) => ViewClients(),
      );
    });
    //List<String> states = new List();
    
    inState.length == 2 ? inState.toUpperCase() : inState.toLowerCase();
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
                    RaisedButton(
                      onPressed: submitData,
                      child: Text('Add Client'),
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
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import './menu.dart';

class NewClient extends StatefulWidget {
  final Function addClient;

  NewClient(this.addClient);

  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
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
    final inPhoneNum = double.parse(phoneNumCon.text);
    if (inFName.isEmpty || inPhoneNum <= 0) {
      return;
    } else {
      widget.addClient(
        inFName,
        inLName,
        inPhoneNum,
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
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
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
                  TextField(
                    controller: phoneNumCon,
                    decoration: InputDecoration(labelText: '123-456-7890'),
                    keyboardType: TextInputType.phone,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: descriptCon,
                    decoration: InputDecoration(labelText: 'a man'),
                    keyboardType: TextInputType.multiline,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: addressCon,
                    decoration: InputDecoration(labelText: '12345 1st st'),
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: cityCon,
                    decoration: InputDecoration(labelText: 'New York'),
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: stateCon,
                    decoration: InputDecoration(labelText: 'New York'),
                    onSubmitted: (_) => submitData(),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: addressCon,
                          decoration: InputDecoration(
                            labelText: 'Address: ',
                          ),
                          keyboardType: TextInputType.streetAddress,
                          onSubmitted: (_) => submitData(),
                        ),
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
                  ElevatedButton(
                    onPressed: submitData,
                    child: Text('Add Client'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

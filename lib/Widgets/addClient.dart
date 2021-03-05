import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import './menu.dart';

class AddClient extends StatefulWidget {
  final Function addClient;

  AddClient(this.addClient);

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
                    // DropdownButton<String>(
                    //   value: dropdownValue,
                    //   icon: Icon(Icons.arrow_downward),
                    //   iconSize: 18,
                    //   elevation: 16,
                    //   style: TextStyle(color: Colors.deepPurple),
                    //   underline: Container(
                    //     height: 2,
                    //     color: Colors.deepPurpleAccent,
                    //   ),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownValue = newValue!;
                    //     });
                    //   },
                    //   items: <String>[
                    //     'Alabama',
                    //     'Alaska',
                    //     'Arizona',
                    //     'Arkansas',
                    //     'California',
                    //     'Colorado',
                    //     'Connecticut',
                    //     'Delaware',
                    //     'District Of Colombia',
                    //     'Florida',
                    //     'Georgia',
                    //     'Hawaii',
                    //     'Idaho',
                    //     'Illinois',
                    //     'Indiana',
                    //     'Iowa',
                    //     'Dansas',
                    //     'Kentucky',
                    //     'Louisiana',
                    //     'Maine',
                    //     'Maryland',
                    //     'Massachusetts',
                    //     'Michigan',
                    //     'Minnesota',
                    //     'Mississippi',
                    //     'Missouri',
                    //     'Montana',
                    //     'Nebraska',
                    //     'Nevada',
                    //     'New Hampshire',
                    //     'New Jersey',
                    //     'New Mexico',
                    //     'New York',
                    //     'North Carolina',
                    //     'North Dakota',
                    //     'Ohio',
                    //     'Oklahoma',
                    //     'Oregon',
                    //     'Pennsylvania',
                    //     'Rhode Island',
                    //     'South Carolina',
                    //     'Tennessee',
                    //     'Texas',
                    //     'Utah',
                    //     'Vermont',
                    //     'Virginia',
                    //     'Washington',
                    //     'West Virginia',
                    //     'Wisconsin',
                    //     'Wyoming'
                    //   ].map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // ),
                    TextField(
                      controller: stateCon,
                      decoration: InputDecoration(labelText: 'State: '),
                      onSubmitted: (_) => submitData(),
                    ), // use a select menu?

                    TextField(
                      controller: phoneNumCon,
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
                    )
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

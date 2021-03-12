import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:flutter/services.dart';
import './drawer.dart';

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
    final inAddress = addressCon.text;
    final inCity = cityCon.text;
    String inState = stateCon.text;
    final inDes = descriptCon.text;
    final inPhoneNum = double.parse(phoneNumCon.text);
    List<String> states = new List();
    states.addAll([
      'aguascalientes',
      'alabama',
      'Al',
      'alaska',
      'AK',
      'arizona',
      'AZ',
      'arkansas',
      'AR',
      'baja california',
      'baja california sur',
      'california',
      'CA',
      'campenche',
      'chiapas',
      'chihuahua',
      'coahuila',
      'colima',
      'colorado',
      'CO',
      'connecticut',
      'CT',
      'delaware',
      'DE',
      'district of colombia',
      'DC',
      'durango',
      'florida',
      'FL',
      'georgia',
      'GA',
      'guanajuato',
      'guerrero',
      'hawaii',
      'HI',
      'hidalgo',
      'idaho',
      'ID',
      'illinois',
      'IL',
      'indiana',
      'IN',
      'iowa',
      'IA',
      'jalisco',
      'kansas',
      'KS',
      'kentucky',
      'KY',
      'louisiana',
      'LA',
      'maine',
      'ME',
      'maryland',
      'MD',
      'massachusetts',
      'MA',
      'mexico',
      'mexico city',
      'michigan',
      'MI',
      'michoacan',
      'minnesota',
      'MN',
      'mississippi',
      'MS',
      'missouri',
      'MO',
      'montana',
      'MT',
      'morelos',
      'nayarit',
      'nebraska',
      'NE',
      'nevada',
      'NV',
      'new hampshire',
      'NH',
      'new jersey',
      'NJ',
      'new mexico',
      'NM',
      'new york',
      'NY',
      'north carolina',
      'NC',
      'north dakota',
      'ND',
      'nuevo leon',
      'oaxaca',
      'ohio',
      'OH',
      'oklahoma',
      'OK',
      'oregon',
      'OR',
      'pennsylvania',
      'PA',
      'puebla',
      'queretaro',
      'quintana roo',
      'rhode island',
      'RI',
      'san luis potosi',
      'sinaloa',
      'sonora',
      'south carolina',
      'SC',
      'south dakota',
      'SD',
      'tabasco',
      'tennessee',
      'TN',
      'texas',
      'TX',
      'tlaxcala',
      'utah',
      'UT',
      'veracruz',
      'vermont',
      'VT',
      'virginia',
      'VA',
      'washington',
      'WA',
      'west virginia',
      'WV',
      'wisconsin',
      'WI',
      'wyoming',
      'WY',
      'yucatan',
      'zacatecas'
    ]);
    inState.length == 2 ? inState.toUpperCase() : inState.toLowerCase();
    if (states.contains(inState)) {
      if (inFName.isEmpty || inPhoneNum <= 0) {
        return;
      } else {
        if (inState == 'aguascalientes' ||
            inState == 'baja california' ||
            inState == 'baja california sur' ||
            inState == 'campenche' ||
            inState == 'chiapas' ||
            inState == 'chihuahua' ||
            inState == 'coahuila' ||
            inState == 'colima' ||
            inState == 'durango' ||
            inState == 'guanajuato' ||
            inState == 'guerrero' ||
            inState == 'hidalgo' ||
            inState == 'jalisco' ||
            inState == 'mexico' ||
            inState == 'mexico city' ||
            inState == 'michoacan' ||
            inState == 'morelos' ||
            inState == 'nayarit' ||
            inState == 'nuevo leon' ||
            inState == 'oaxaca' ||
            inState == 'puebla' ||
            inState == 'queretaro' ||
            inState == 'quintana roo' ||
            inState == 'san luis potosi' ||
            inState == 'sinaloa' ||
            inState == 'sonora' ||
            inState == 'tabasco' ||
            inState == 'tlaxcala' ||
            inState == 'veracruz' ||
            inState == 'yucatan' ||
            inState == 'zacatecas') {
          inState += ', Mexico';
        } else {
          if (inState != 'aguascalientes' &&
              inState != 'baja california' &&
              inState != 'baja california sur' &&
              inState != 'campenche' &&
              inState != 'chiapas' &&
              inState != 'chihuahua' &&
              inState != 'coahuila' &&
              inState != 'colima' &&
              inState != 'durango' &&
              inState != 'guanajuato' &&
              inState != 'guerrero' &&
              inState != 'hidalgo' &&
              inState != 'jalisco' &&
              inState != 'mexico' &&
              inState != 'mexico city' &&
              inState != 'michoacan' &&
              inState != 'morelos' &&
              inState != 'nayarit' &&
              inState != 'nuevo leon' &&
              inState != 'oaxaca' &&
              inState != 'puebla' &&
              inState != 'queretaro' &&
              inState != 'quintana roo' &&
              inState != 'san luis potosi' &&
              inState != 'sinaloa' &&
              inState != 'sonora' &&
              inState != 'tabasco' &&
              inState != 'tlaxcala' &&
              inState != 'veracruz' &&
              inState != 'yucatan' &&
              inState != 'zacatecas' &&
              inState.length != 2) {
            int stateIndex = states.indexOf(inState) + 1;
            inState = states.elementAt(stateIndex);
            widget.addClient(
              inFName,
              inLName,
              inAddress,
              inCity,
              inState,
              inDes,
              inPhoneNum,
            );
            Navigator.of(context).pop();
          }
        }
      }
    } else {
      return;
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

import 'package:flutter/material.dart';

class EditClientInfo extends StatefulWidget {
  final Function editClient;
  EditClientInfo(this.editClient);
  @override
  _EditClientInfoState createState() => _EditClientInfoState();
}

//use an if function to make this a dual purpose add or edit
class _EditClientInfoState extends State<EditClientInfo> {
  //create controllers for the textfields
  final firstNameCon = TextEditingController(),
      lastNameCon = TextEditingController(),
      addressCon = TextEditingController(),
      cityCon = TextEditingController(),
      stateCon = TextEditingController(),
      phoneNumCon = TextEditingController(),
      desciptionCon = TextEditingController();
  void submitData() {
    final entFirstNameCon = firstNameCon.text,
        entLastNameCon = lastNameCon.text,
        entAddressCon = addressCon.text,
        entCityCon = cityCon.text,
        entStateCon = stateCon.text,
        entPhoneNumCon = phoneNumCon.text;
    if (entFirstNameCon.isEmpty ||
        entLastNameCon.isEmpty ||
        entAddressCon.isEmpty ||
        entCityCon.isEmpty ||
        entStateCon.isEmpty ||
        entPhoneNumCon.isEmpty) {
      return;
    } else {
      widget.editClient(
        entFirstNameCon,
        entLastNameCon,
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            //imageField on top
            //give them initial values if editing
            TextField(
              controller: firstNameCon,
              decoration: InputDecoration(labelText: 'First Name'),
              onSubmitted: (_) => submitData(),
            ),

            TextField(
              controller: lastNameCon,
              decoration: InputDecoration(labelText: 'Last Name'),
              onSubmitted: (_) => submitData(),
            ),

            TextField(
              controller: addressCon,
              decoration: InputDecoration(labelText: 'Address'),
              keyboardType: TextInputType.streetAddress,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: cityCon,
              decoration: InputDecoration(labelText: 'City'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: stateCon,
              decoration: InputDecoration(labelText: 'State'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: desciptionCon,
              decoration: InputDecoration(labelText: 'Description'),
              onSubmitted: (_) => submitData(),
            ),
          ],
        ),
      ),
    );
  }
}

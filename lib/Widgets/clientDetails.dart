import 'package:flutter/material.dart';
import '../Models/client.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class ClientDetails extends StatelessWidget {
  //client['_id'],client['_id'],client['fname'],client['lname'],client['city'],client['state'],client['address'],client['phoneNumber']
  String id, fname, lname, city, address, state;
  var phoneNumber;

  ClientDetails(this.id, this.fname, this.lname, this.city, this.state,
      this.address, this.phoneNumber);

  final ClientsApi api = ClientsApi();
  @override
  // _clientDetailsState createState() => _clientDetailsState();

  @override
  Widget build(BuildContext context) {
    print(fname);
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
                  // client.toList()
                  //...client<Widget>(
                  ListView(
                    children: <Widget>[
                      Text(fname),
                      Text(lname),
                      Text(city),
                      Text(state),
                      Text(address),
                      Text(phoneNumber),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: TextButton(
                          onPressed: () => {null},
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              child: Text(""),
                            ),
                          ),
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
    );
  }
}

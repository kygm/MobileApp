import 'package:flutter/material.dart';
import '../Models/client.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';
import './viewClients.dart';

class ClientDetails extends StatelessWidget {
  //client['_id'],client['_id'],client['fname'],client['lname'],client['city'],client['state'],client['address'],client['phoneNumber']
  final String id, fname, lname, city, address, state;
  final phoneNumber;
  var c1 = Colors.lightBlue;
  ClientDetails(this.id, this.fname, this.lname, this.city, this.state,
      this.address, this.phoneNumber);

  final ClientsApi api = ClientsApi();
  @override
  // _clientDetailsState createState() => _clientDetailsState();

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
                              SizedBox(
                                width: double.infinity,
                                child: ColoredBox(
                                  color: c1,
                                  child: Center(
                                      child: Text("First Name:     " + fname)),
                                ),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: Text("Last Name:     " + lname)),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: Text("City Name:     " + city)),
                              ),
                              ColoredBox(
                                color: c1,
                                child:
                                    Center(child: Text("State:      " + state)),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: Text("Address:     " + address)),
                              ),
                              ColoredBox(
                                color: c1,
                                child: Center(
                                    child: Text(
                                        "Phone Number:     " + phoneNumber)),
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

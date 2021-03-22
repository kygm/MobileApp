import 'package:flutter/material.dart';
import '../Models/client.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class ClientDetails extends StatefulWidget {
  //client['_id'],client['_id'],client['fname'],client['lname'],client['city'],client['state'],client['address'],client['phoneNumber']
  final id;
  final fname;
  final lname;
  final city;
  final address;
  final phoneNumber;
  final state;

  ClientDetails(this.id, this.fname, this.lname, this.city, this.state, this.address, this.phoneNumber);

  final ClientsApi api = ClientsApi();
  @override
  _clientDetailsState createState() => _clientDetailsState();
}

class _clientDetailsState extends State<ClientDetails> {
  List clients = [];
  bool loading = true;

  get client => client;
  void initState() {
    super.initState();
    final s = widget.api.testApi();
    print(s);
    widget.api.getClients().then((data) {
      setState(() {
        clients = data;
        loading = false;
        print(client);
      });
    });
    // print(d);
  }

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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
                  // client.toList()
                  //...client<Widget>(
                   ListView(
                     children: <Widget>[
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

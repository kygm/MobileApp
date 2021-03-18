import 'dart:io';

import '../api.dart';
import '../Models/client.dart';
import 'package:flutter/material.dart';
import '../Models/client.dart';
import './addTransaction.dart';
import '../main.dart';
import './drawer.dart';
import 'dart:developer';

class ViewClients extends StatefulWidget {
  ViewClients({Key key, this.title, this.viewClients}) : super(key: key);
  final String title;
  //pull from database
  final List<Client> viewClients;

  final ClientsApi api = ClientsApi();
  @override
  _ViewClientsState createState() => _ViewClientsState();
}

class _ViewClientsState extends State<ViewClients> {
  List clients = [];
  bool loading = true;
  String x;
  void onDelete(id) {
    print("Deleting " + id + "!");
  }

  void _addItem() {
    setState(() {
      clients.add({'fname': 'First', 'lname': 'Last'});
    });
  }

  void initState() {
    super.initState();
    //print(3);
    final s = widget.api.testApi();
    //print(s.toString());
    //
    //print(s);
    //print("test");
    
    widget.api.getClients().then((data) {
      setState(() {
        clients = data;
        print(clients);
        loading = false;
      });
    });
    
    //print(3);
  }

  Widget build(BuildContext context) {
    final s1 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final s2 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Theme.of(context).primaryColor,
    );
    stderr.writeln(clients.toString());
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
            Container(
              child: clients == null
                  ? Column(
                      children: <Widget>[
                        Text('No Clients Yet, null'),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 200,
                          //    child: Image.asset(
                          //   'images/waiting.png',
                          //    fit: BoxFit.cover,
                          // ),
                        ),
                      ],
                    )
                  : clients.isEmpty
                      ? Column(
                          children: <Widget>[
                            Text('No Clients Yet, empty'),
                            RaisedButton(
                              color: Colors.orange,
                              child: Text("Add Dummy Client to List"),
                              onPressed: () => {_addItem()},
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              height: 200,
                              // child: Image.asset(
                              //   'images/waiting.png',
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ],
                        )
                      : ListView(children: [
                          ...clients
                              .map<Widget>(
                                (client) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30,
                                        child: Text("TS"),
                                      ),
                                      title: Text(
                                        (client['fname'] +
                                            " " +
                                            client['lname']),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      trailing: FlatButton(
                                        onPressed: () => {
                                          //onDelete(contact['_id']);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          size: 30,
                                        ),
                                      ),
                                    )),
                              )
                              .toList(),
                        ]),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'dart:io';

//import 'package:KYGM_Mobile/Widgets/clientDetails.dart';
//import 'package:KYGM_Mobile/widgets/clientDetails.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';
import '../Models/client.dart';
import 'package:flutter/material.dart';
import './addTransaction.dart';
import '../main.dart';
import './drawer.dart';
import './addTransaction.dart';
import './clientDetails.dart';
import './addClient.dart';
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

  void _addNewTransaction(String phoneNum) {}

  void _editClient(id) {
    print("Edit " + id);
  }

  void _addClient() {
    setState(() {
      print("add client");
      // AddClient(_addNewTransaction);
    });
  }

  void _addTransaction(id) {
    setState(() {
      print("Add transact for " + id);
      AddTransaction(_addNewTransaction);
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
        //print(clients);
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
    //stderr.writeln(clients.toString());
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
            Text(
              "Click on client to add transact",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("Add a Client to List"),
              onPressed: () => {_addClient()},
            ),
            Container(
              child: clients.isEmpty
                  ? Column(
                      children: <Widget>[
                        Text('No Clients In DB'),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(15.0),
                          children: [
                            ...clients
                                .map<Widget>(
                                  (client) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: FlatButton(
                                      onPressed: () =>
                                          {_addTransaction(client['_id'])},
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 30,
                                          child: Text(client['fname']
                                                  .substring(0, 1) +
                                              client['lname'].substring(0, 1)),
                                        ),
                                        title: Text(
                                          (client['fname'] +
                                              " " +
                                              client['lname']),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        trailing: FlatButton(
                                          onPressed: () => {
                                            //_editClient(client['_id']),
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ClientDetails(client),
                                              ),
                                            ),
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ]),
                    ),
            ),
            //FloatingActionButton(onPressed: null)
          ],
        ),
      ),
    );
  }
}

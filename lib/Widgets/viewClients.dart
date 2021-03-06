//import 'dart:io';

//import 'package:KYGM_Mobile/Widgets/clientDetails.dart';
//import 'package:KYGM_Mobile/widgets/clientDetails.dart';
import 'package:KYGM_Mobile/widgets/searchClient.dart';
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
        title: TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          child: Text(
            "KYGM Services",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Add Clients'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddClient(_addNewTransaction)));
                    },
                  ),
                ),
                ElevatedButton(
                  child: Text('Search Clients'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchClient()));
                  },
                ),
              ],
            ),
            Container(
              child: clients.isEmpty
                  ? Column(
                      children: <Widget>[
                        Center(
                          child: CircularProgressIndicator(),
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
                                    child: TextButton(
                                      onPressed: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClientDetails(
                                                      client['_id'],
                                                      client['fname'],
                                                      client['lname'],
                                                      client['address'],
                                                      client['city'],
                                                      client['state'],
                                                      client['phoneNumber'],
                                                      client['descript'])),
                                        ),
                                      },
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

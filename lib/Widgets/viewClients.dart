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
  void initState() {
    super.initState();
    print(3);
    final s = widget.api.getClients();
    print(s.toString());
    print(s);
    //this works but I cant figure out how to get any further than the outputting 'Instance of  Future<list<Client>>'
    widget.api.getClients().then((data) {
      print(
          3); //to see these, go to your browser debugging tool over to logging. for some reason
      //its not hitting anything in the widget.api.get  not sure why.
      setState(() {
        clients = data;
        print(data.toString());
        x = data.toString();
        loading = false;
      });
    });
    print(3);
  }

  Widget build(BuildContext context) {
    final s1 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final s2 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Theme.of(context).primaryColor,
    );
    stderr.writeln('4');
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
                        Text('No Clients Yet'),
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
                  : clients.isEmpty
                      ? Column(
                          children: <Widget>[
                            Text('No Clients Yet'),
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
                      : ListView(
                          children: clients.map((cli) {
                            Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text(cli.fname, style: s2),
                                        Text(cli.lname, style: s2),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(cli.address),
                                      Text(
                                        cli.city + ', ' + cli.state,
                                      ),
                                      Text(cli.phoneNumber.toString()),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(cli.descript),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

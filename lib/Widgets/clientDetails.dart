import 'package:flutter/material.dart';
import '../Models/client.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class ClientDetails extends StatefulWidget {
  ClientDetails(Map client);

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
                  ...client<Widget>(
                    (cli) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: FlatButton(
                        onPressed: () => {null},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Text('l'
                                // cli['fname'].substring(0, 1) +
                                //   cli['lname'].substring(0, 1)),
                                ),
                          ),
                        ),
                      ),
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

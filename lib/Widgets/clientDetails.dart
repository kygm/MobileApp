import 'package:flutter/material.dart';
import '../Models/client.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class clientDetails extends StatefulWidget {
  clientDetails(List client, {Key key, this.title, this.viewClients})
      : super(key: key);
  final String title;
  //pull from database
  final List<Client> viewClients;

  final ClientsApi api = ClientsApi();
  @override
  _clientDetailsState createState() => _clientDetailsState();
}

class _clientDetailsState extends State<clientDetails> {
  List clients = [];
  bool loading = true;
  void initState() {
    super.initState();
    final s = widget.api.testApi();
    print(s);
    widget.api.getClients().then((data) {
      setState(() {
        clients = data;

        loading = false;
      });
    });
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
                children: [
                  ...clients.map<Widget>(
                    (client) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      // client['id']==id?
                      child: FlatButton(
                        onPressed: () => {},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Text(client['fname'].substring(0, 1) +
                                client['lname'].substring(0, 1)),
                          ),
                          title: Text(
                            (client['fname'] + " " + client['lname']),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

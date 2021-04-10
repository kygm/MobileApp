import 'package:flutter/material.dart';
import 'package:KYGM_Mobile/main.dart';
import 'drawer.dart';
import 'addClient.dart';
import 'clientDetails.dart';
import 'package:KYGM_Mobile/api.dart';

class SearchClient extends StatefulWidget {
  final ClientsApi api = ClientsApi();

  @override
  _SearchClientState createState() => _SearchClientState();
}

class _SearchClientState extends State<SearchClient> {
  void _addNewTransaction(String phoneNum) {}
  final myController = TextEditingController();
  List clients = [];
  var _search = false;

  void doSearch() {
    widget.api.searchClient(myController.text).then((data) {
      setState(() {
        clients = data;
        _search = true;
        print(clients.toString());
      });
    });
  }

  @override
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
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
          ),
        ),
      ),
      body: !_search
          ? Column(
              children: <Widget>[
                TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Search by first name',
                  ),
                ),
                ElevatedButton(
                    child: Text("Serach"),
                    onPressed: () => {
                          doSearch(),
                        }),
              ],
            )
          //if search false
          : Text(clients.toString()),
    );
  }
}

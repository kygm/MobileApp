import 'package:flutter/material.dart';
import 'package:KYGM_Mobile/main.dart';
import 'drawer.dart';
import 'addClient.dart';
import 'clientDetails.dart';
import 'package:KYGM_Mobile/api.dart';
import './viewClients.dart';

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
      body: 
      
      !_search
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
          : clients.isEmpty 
          ? Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text("No clients with that name \n Check spelling.", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ElevatedButton(onPressed: () => {
                  Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewClients()),
                ),
                }, child: Text("Back to View All"))
              ],
            ),
          ) :
          
           Column(
              children: [
                ElevatedButton(onPressed: () => {
                  Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewClients()),
                ),
                }, child: Text("Back to View All")),
                Container(
                  child: Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(15.0),
                        children: [
                          ...clients
                              .map<Widget>(
                                (client) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: TextButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ClientDetails(
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
              ],
            ),
    );
  }
}

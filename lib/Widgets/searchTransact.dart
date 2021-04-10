import 'package:flutter/material.dart';
import './drawer.dart';
import './mostOfApp.dart';
import 'package:KYGM_Mobile/main.dart';
import 'package:KYGM_Mobile/api.dart';
import './transactionDetails.dart';

class SearchTransact extends StatefulWidget {
  final ClientsApi api = ClientsApi();
  @override
  _SearchTransactState createState() => _SearchTransactState();
}

class _SearchTransactState extends State<SearchTransact> {
  final myController = TextEditingController();
  var _search = false;
  List transacts = [];

  void doSearch() {
    widget.api.searchTransact(myController.text).then((data) {
      setState(() {
        transacts = data;
        _search = true;
        print(transacts.toString());
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
      //if search true
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
          : 
          
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Transactions",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: transacts.isEmpty && _search == false
                  ? Column(
                      children: <Widget>[
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    )
                  : transacts.isEmpty ? Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(15.0),
                          children: [
                            ...transacts
                                .map<Widget>(
                                  (transact) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: TextButton(
                                      onPressed: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionDetails(
                                                    transact['_id'],
                                                    transact['fname'],
                                                    transact['lname'],
                                                    transact['transactName'],
                                                    transact['transactDate'],
                                                    transact['transactTime'],
                                                    transact['descript'],
                                                    transact['transactCost'],
                                                    transact['transactPrice']),
                                          ),
                                        ),
                                      },
                                      child: ListTile(
                                        leading: ColoredBox(
                                          color: Colors.lightBlue,
                                          child: Text(
                                            "\$" +
                                                (transact['transactPrice'] -
                                                        transact[
                                                            'transactCost'])
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.yellow),
                                          ),
                                        ),
                                        title: Text(
                                          (transact['fname'].toString() +
                                              " " +
                                              transact['lname'].toString()),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ]),
                    )
                    : Text("No Transacts Found!"),
            ),
          ],
        ),
      ),
            //Text(transacts.toString()),
    );
  }
}

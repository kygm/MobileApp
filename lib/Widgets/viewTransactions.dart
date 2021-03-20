import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';
import './drawer.dart';

class ViewTransactions extends StatefulWidget {
  final List<Transaction> viewTransactions;
  ViewTransactions(this.viewTransactions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("KYGM Services: View Transactions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 350,
              child: viewTransactions == null
                  ? Column(
                      children: <Widget>[
                        Text('No Transactions Yet'),
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
                  : viewTransactions.isEmpty
                      ? Column(
                          children: <Widget>[
                            Text('No Transactions Yet'),
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
                            ...transacts
                                .map<Widget>(
                                  (client) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: FlatButton(
                                      onPressed: () => {_addTransaction()},
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
                                            _editClient(client['_id']),
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
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

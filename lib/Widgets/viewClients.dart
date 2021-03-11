import '../Models/client.dart';
import 'package:flutter/material.dart';
import '../Models/client.dart';
import './addTransaction.dart';
import '../main.dart';
import './menu.dart';

class ViewClients extends StatelessWidget {
  void _addNewTransaction(String phoneNum) {
    //   final newTrans = Transaction(
    //     clientId: phoneNum,
    //     title: inTitle,
    //     dateEntered: DateTime.now(),
    //     cost: inCost,
    //     price: inPrice,
    //     //serviceId: d,
    //     date: inDate,
    //     description: inDescription,
    //     duration: inDuration,
    //   );
    //   setState(() {
    //     _userTransactions.add(newTrans);
    //   });
  }
  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return AddTransaction(_addNewTransaction);
        });
  }

  //pull from database
  final List<Client> viewClients;
  ViewClients(this.viewClients);

  @override
  Widget build(BuildContext context) {
    final s1 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final s2 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Theme.of(context).primaryColor,
    );
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              // padding: EdgeInsets.zero,
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.lightBlue),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app, then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Timer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('View Clients'),
              onTap: () {
                Navigator.pop(context);

                print("hi");
              },
            ),
            ListTile(
              title: Text('View Transactions'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add Client'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add Transaction'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
              child: viewClients.isEmpty
                  ? Column(
                      children: <Widget>[
                        Text('No Expense Items Yet'),
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
                      children: viewClients.map((cli) {
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
                                    //Text(cli.firstName, style: s2),
                                    //Text(cli.lastName, style: s2),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /*
                                  Text(cli.address),
                                  Text(
                                    cli.city + ', ' + cli.state,
                                  ),
                                  Text(cli.phoneNumber.toString()),
                                  */
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //Text(cli.description),
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

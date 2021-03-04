import 'package:flutter/material.dart';
import './viewClients.dart';
import './newClient.dart';
import './viewTransactions.dart';
import './newTransaction.dart';
import '../main.dart';
import './jobTimer.dart';
import '../globals.dart';

class Menu extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Timer'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobTimer()),
                );
              },
            ),
            ListTile(
              title: Text('View Clients'),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ViewClients()),
                // );
              },
            ),
            ListTile(
              title: Text('View Transactions'),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ViewTransactions()),
                // );
              },
            ),
            ListTile(
              title: Text('Add Client'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewClient(_addNewTransaction)),
                );
              },
            ),
            ListTile(
              title: Text('Add Transaction'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewTransaction(_addNewTransaction)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

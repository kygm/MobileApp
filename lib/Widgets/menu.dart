import './timerPage.dart';
import 'package:flutter/material.dart';
import './viewClients.dart';
import './addClient.dart';
import './viewTransactions.dart';
import './addTransaction.dart';
import '../main.dart';
import './timerPage.dart';
import '../globals.dart';

class Menu extends StatelessWidget {
  void _addNewTransaction(String phoneNum) {
    //so it doesnt break
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
                //  close the drawer, then Update the state of the app
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
                  MaterialPageRoute(builder: (context) => TimerPage()),
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
                      builder: (context) => AddClient(_addNewTransaction)),
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
                      builder: (context) => AddTransaction(_addNewTransaction)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

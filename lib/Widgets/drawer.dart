import '../main.dart';
import 'package:flutter/material.dart';
import 'viewClients.dart';
import 'viewTransactions.dart';
import './addClient.dart';
import './addTransaction.dart';
import '../Models/client.dart';
import '../Models/transaction.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<Client> viewClients; //filler so it doesnt break
  List<Transaction> viewTransactions; //filler so it doesnt break
  void _addNewTransaction(String phoneNum) {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          /*
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
            */
          ListTile(
            title: Text('View Clients'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewClients()),
              );
            },
          ),
          ListTile(
            title: Text('View Transactions'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewTransactions(viewTransactions)),
              );
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
                MaterialPageRoute(builder: (context) => ViewClients()),
              );
            },
          ),
        ],
      ),
    );
  }
}

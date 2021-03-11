import 'package:flutter/material.dart';
import '../main.dart';
import './viewClients.dart';
import './viewTransactions.dart';
//import './timerPage.dart';
import 'drawer.dart';
import '../Models/client.dart';
import '../Models/transaction.dart';
import './addClient.dart';
import './addTransaction.dart';
import 'package:intl/intl.dart';

class MostOfApp extends StatefulWidget {
  final List clients;
  MostOfApp(this.clients);
  @override
  _MostOfAppState createState() => _MostOfAppState();
}

class _MostOfAppState extends State<MostOfApp> {
  List<Client> viewClients; //filler so it doesnt break
  List<Transaction> viewTransactions; //filler so it doesnt break
  void _addNewTransaction(String phoneNum) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //if NOT authorized exec login widget
            // !_auth
            //     ? Login()
            //     //else send user to main app
            //     : Text("Logged In"),
            Container(
              height: 150,
              child: ColoredBox(
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: ColoredBox(
                          color: Colors.grey[300],
                          child: Center(
                            child: Text(
                              "Todays Date\n" +
                                  DateFormat.yMd()
                                      .format(DateTime.now())
                                      .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: ColoredBox(
                          color: Colors.grey[300],
                          child: Center(
                            child: Text(
                              'KYGM Services Client Tracking',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.green,
              //               minWidth: 370,
              child: Text('This Months Revenue'),
              onPressed: () => {print("under dev...")},
            ),
            FlatButton(
              child: Text('View Clients'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewClients(viewClients)));
              },
            ),
            FlatButton(
              child: Text('Add Clients'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddClient(_addNewTransaction)));
              },
            ),
            FlatButton(
              child: Text('View Transactions'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewTransactions(viewTransactions)));
              },
            ),
            FlatButton(
              child: Text('Add Transactions'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTransaction(_addNewTransaction)),
                );
              },
            ),
            /*
            FlatButton(
              child: Text('Timer'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => 
                  TimerPage()),
                );
              },
            ),
            FlatButton(
              child: Text('Test DB Connection'),
              onPressed: () {
                // DBConnection();
              },
              color: Colors.red,
            ),
            */
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../main.dart';
import './viewClients.dart';
import './viewTransactions.dart';
//import './timerPage.dart';
import 'drawer.dart';
import '../Models/client.dart';
import '../Models/transaction.dart';
import './addClient.dart';
import '../api.dart';
import './addTransaction.dart';
import 'package:intl/intl.dart';

class MostOfApp extends StatefulWidget {
  final List clients;
  MostOfApp(this.clients);
  final ClientsApi api = ClientsApi();
  @override
  _MostOfAppState createState() => _MostOfAppState();
}

class _MostOfAppState extends State<MostOfApp> {
  List transacts = [];
  bool loading = true;
  String x;
  double getTotal(transacts) {
    double x = 0;
    transacts.forEach((t) {
      x += t.transactPrice;
    });
    return x;
  }

  void initState() {
    super.initState();
    final s = widget.api.getTransactions();
    widget.api.getTransactions().then((data) {
      setState(() {
        transacts = data;
        //print(transacts.toString());
        loading = false;
      });
    });
  }

  void _addNewTransaction(String phoneNum) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //if NOT authorized exec login widget
            // !_auth
            //     ? Login()
            //     //else send user to main app
            //     : Text("Logged In"),
            Container(
              height: 120,
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
              onPressed: () => {
                print("under dev..."),
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _revenueWindow(context),
                )
              },
            ),
            TextButton(
              child: Text(
                'View Clients',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewClients()));
              },
            ),
            TextButton(
              child: Text(
                'Add Clients',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddClient(_addNewTransaction)));
              },
            ),
            TextButton(
              child: Text(
                'View Transactions',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewTransacts()));
              },
            ),
            TextButton(
              child: Text(
                'Add Transactions',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewClients()),
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

  Widget _revenueWindow(BuildContext context) {
    String total = getTotal(transacts).toString();
    return new AlertDialog(
      title: const Text('Total Revenue'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(total),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

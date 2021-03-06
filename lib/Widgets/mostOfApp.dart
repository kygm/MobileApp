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
  double getTotal(transacts) {
    double p = 0, c = 0, total = 0;
    // >DateTime.now().subtract(Duration(days: 31))
    transacts.forEach((t) {
      // if (DateTime.parse(t['transactDate']).month == DateTime.now().month) {
      p += t['transactPrice'];
      c += t['transactCost'];
      // }
    });
    total = p - c;
    return total;
  }

  void initState() {
    super.initState();
    final s = widget.api.getTransactions();
    widget.api.getTransactions().then((data) {
      setState(() {
        transacts = data;
        //print(transacts.toString());
        loading = false;
        getTotal(transacts);
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
              child: Text('Total Revenue'),
              onPressed: () => {
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
            Image.asset(
              'images/KYGM-LOGO.png',
              height: 150,
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
          Text(NumberFormat.simpleCurrency().format(double.parse(total))),
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

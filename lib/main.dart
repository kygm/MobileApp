import './Models/client.dart';
import './Widgets/addTransaction.dart';
import './Widgets/timerPage.dart';
import 'package:flutter/material.dart';
import 'globals.dart';
import './Widgets/login.dart';
import './Widgets/viewClients.dart';
import './Widgets/addClient.dart';
import './Widgets/viewTransactions.dart';
import 'package:intl/intl.dart';
import './Models/transaction.dart';
import './Widgets/menu.dart';

//var db = Db("")
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KYGM Services',
      theme: ThemeData(
        primaryColor: Colors.grey[200],
        accentColor: Colors.lightBlue,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 21),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

//terniary operator construct: condition ? condition met : else
class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTransaction(String phoneNum) {
    // final newTrans = Transaction(
    // //serviceId: d,
    //   clientId: phoneNum,
    //   title: inTitle,
    //   cost: inCost,
    //   price: inPrice,
    //   date: inDate,
    //   duration: inDuration,
    //   description: inDescription,
    //   dateEntered: DateTime.now(),
    // );
    // setState(() {
    //   _userTransactions.add(newTrans);
    // });
  }
  List<Client> viewClients; //filler so it doesnt break
  List<Transaction> viewTransactions; //filler so it doesnt break
  //instance variables here
  bool _auth = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //put drawer function here
          Scaffold(
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
                    MaterialPageRoute(builder: (context) => TimerPage()),
                  );
                },
              ),
              ListTile(
                title: Text('View Clients'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewClients(viewClients)),
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
                        builder: (context) =>
                            ViewTransactions(viewTransactions)),
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
                    MaterialPageRoute(
                        builder: (context) => ViewClients(viewClients)),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
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
                //minWidth: 370,
                child: Text('This Months Revenue'),
                onPressed: () {},
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
                        builder: (context) =>
                            AddTransaction(_addNewTransaction)),
                  );
                },
              ),
              FlatButton(
                child: Text('Timer'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:KYGM_Mobile/Models/client.dart';
import 'package:flutter/material.dart';
import 'globals.dart';
import './login.dart';
import 'package:intl/intl.dart';

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
  //instance variables here
  bool _auth = false;
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
        title: Text("KYGM Services"),
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
              height: 80,
              child: ColoredBox(
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    "Todays Date\n" +
                        DateFormat.yMd().format(DateTime.now()).toString(),
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
              height: 50,
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
            FlatButton(
              child: Text('View Revenue'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('View Clients'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Add Clients'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('View Transactions'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('View Transactions'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

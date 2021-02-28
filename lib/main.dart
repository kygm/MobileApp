import 'package:flutter/material.dart';
import 'globals.dart';
import './login.dart';

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
        primaryColor: Colors.grey,
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
            !_auth
                ? Login()
                //else send user to main app
                : Text("Logged In"),
          ],
        ),
      ),
    );
  }
}

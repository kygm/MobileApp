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
      theme: ThemeData(),
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
      appBar: AppBar(
        title: Text("KYGM Services"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //if NOT authorized exec login widget
            !_auth ? 
            Login()
            //else send user to main app
            :

            Text("Logged In"),
          ],
        ),
      ),
    );
  }
}

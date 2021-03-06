import 'package:flutter/material.dart';
import 'api.dart';
import './widgets/mostOfApp.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  final ClientsApi api = ClientsApi();
}

class _MyHomePageState extends State<MyHomePage> {
  //instance variables here
  bool _auth = false;
  bool _dbLoaded = false;
  List clients = [];
  @override
  void initState() {
    super.initState();
    widget.api.getClients().then((data) {
      setState(() {
        //print(data);
        clients = data;
        _dbLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _dbLoaded
          ? MostOfApp(clients)
          : 
          Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("DB Loading (May take up to 1 minute)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import './drawer.dart';
import '../api.dart';
import '../main.dart';
import '../Models/transaction.dart';

class ViewTransacts extends StatefulWidget {
ViewTransacts({Key key, this.title, this.viewClients}) : super(key: key);

final String title;
  //pull from database
  final List<Transaction> viewClients;

  final ClientsApi api = ClientsApi();
  @override
  _ViewTransactsState createState() => _ViewTransactsState();
}

class _ViewTransactsState extends State<ViewTransacts> {
  //instance var declaration
  List transacts = [];
  bool loading = true;
  String x;

  //instance f(x) declaration
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Transactions",
              style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Text(
              "Revenue | Full Name | View Details",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              child: transacts.isEmpty
                  ? Column(
                      children: <Widget>[
                        Text('No Transacts In DB'),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(15.0),
                          children: [
                            ...transacts
                                .map<Widget>(
                                  (transact) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: FlatButton(
                                      onPressed: () => {null},
                                      child: ListTile(
                                        leading: ColoredBox(
                                          color: Colors.lightBlue,
                                          child: Text(
                                            "\$" +(transact['transactPrice'] - transact['transactCost']).toString(),
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.yellow
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          (transact['fname'] +
                                              " " +
                                              transact['lname']),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        trailing: FlatButton(
                                          onPressed: () => {
                                            null
                                          },
                                          child: Icon(
                                            Icons.arrow_forward,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
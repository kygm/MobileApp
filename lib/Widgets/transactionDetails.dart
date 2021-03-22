import 'package:KYGM_Mobile/Widgets/viewTransactions.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class TransactionDetails extends StatelessWidget {
  final String fname, lname, title, date, time, description;
  final int cost, price;
  var c1 = Colors.lightBlue;
  TransactionDetails(this.fname, this.lname, this.title, this.date, this.time,
      this.description, this.cost, this.price);
  @override
  Widget build(BuildContext context) {
    print(title);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: TextButton(
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
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                            child: Expanded(
                              child: SizedBox(
                                height: 1000,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView(
                                    children: <Widget>[
                                      ColoredBox(
                                        color: c1,
                                        child: Text(
                                            "Name:    " + fname + ' ' + lname),
                                      ),
                                      ColoredBox(
                                        color: c1,
                                        child: Text("Title:    " + title),
                                      ),
                                      ColoredBox(
                                        color: c1,
                                        child: Text("Date:    " + date),
                                      ),
                                      ColoredBox(
                                        color: c1,
                                        child:
                                            Text("Time:    " + time + " hours"),
                                      ),
                                      ColoredBox(
                                        color: c1,
                                        child: Text(
                                            "Cost:    \$" + cost.toString()),
                                      ),
                                      ColoredBox(
                                        color: c1,
                                        child: Text(
                                            "Price:    \$" + price.toString()),
                                      ),
                                      ColoredBox(
                                        color: c1,
                                        child: Text(
                                            "Description:    " + description),
                                      ),
                                      TextButton(
                                        child: Text(
                                          'Back To Transactions',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.lightGreen)),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewTransacts()),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

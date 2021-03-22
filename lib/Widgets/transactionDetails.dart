import 'package:flutter/material.dart';
import '../main.dart';
import './drawer.dart';
import 'package:flutter/rendering.dart';
import '../api.dart';

class TransactionDetails extends StatelessWidget {
  final String fname, lname, title, date, time, description;
  final int cost, price;
  TransactionDetails(this.fname, this.lname, this.title, this.date, this.time,
      this.description, this.cost, this.price);
  @override
  Widget build(BuildContext context) {
    print(title);
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
                                child: ListView(
                                  children: <Widget>[
                                    Text("Name:    " + fname + ' ' + lname),
                                    Text("Title:    " + title),
                                    Text("Date:    " + date),
                                    Text("Time:    " + time),
                                    Text("Cost:    " + cost.toString()),
                                    Text("Price:    " + price.toString()),
                                    Text("Description:    " + description),
                                  ],
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

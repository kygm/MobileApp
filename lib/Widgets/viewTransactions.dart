import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';
import './menu.dart';

class ViewTransactions extends StatefulWidget {
  final List<Transaction> viewTransactions;
  ViewTransactions(this.viewTransactions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KYGM Services: View Transactions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 350,
              child: viewTransactions.isEmpty
                  ? Column(
                      children: <Widget>[
                        Text('No Expense Items Yet'),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 200,
                          // child: Image.asset(
                          //   'images/waiting.png',
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ],
                    )
                  : ListView(
                      children: viewTransactions.map((tran) {
                        return Card(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '\$${tran.cost.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    tran.title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    DateFormat.yMMMEd().format(tran.date),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

//import './timerPage.dart';
import 'package:flutter/material.dart';
import './viewClients.dart';
import './addClient.dart';
import './viewTransactions.dart';
import './addTransaction.dart';
import '../main.dart';
//import './timerPage.dart';
import '../globals.dart';
import '../Models/client.dart';
import '../Models/transaction.dart';
import 'drawer.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Client> viewClients; //filler so it doesnt break
  List<Transaction> viewTransactions; //filler so it doesnt break
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer()
    );
  }
}

void _addNewTransaction(String phoneNum) {
  //so it doesnt break
  //   final newTrans = Transaction(
  //     clientId: phoneNum,
  //     title: inTitle,
  //     dateEntered: DateTime.now(),
  //     cost: inCost,
  //     price: inPrice,
  //     //serviceId: d,
  //     date: inDate,
  //     description: inDescription,
  //     duration: inDuration,
  //   );
  //   setState(() {
  //     _userTransactions.add(newTrans);
  //   });
}

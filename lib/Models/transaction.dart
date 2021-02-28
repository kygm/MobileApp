import 'package:flutter/foundation.dart';

class Transaction {
  final String serviceId;
  final String clientId;
  final String title;
  final double cost;
  final double price;
  final DateTime date;
  final double duration;
  final String description;
  final DateTime dateEntered;

  Transaction({
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.dateEntered,
    @required this.clientId,
    @required this.serviceId,
    @required this.cost,
    @required this.price,
    this.duration,
  });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Client {
  final String firstName;
  final String lastName;
  final int age;
  final DateTime dob;
  final String address;
  final String city;
  final String state;
  final String description;
  final int phoneNumber;
  Client({
    @required this.firstName,
    @required this.lastName,
    @required this.age,
    @required this.dob,
    @required this.address,
    @required this.city,
    @required this.state,
    @required this.description,
    @required this.phoneNumber,
  });
}

import 'package:KYGM_Mobile/Models/transaction.dart';
import 'package:dio/dio.dart';

import './Models/client.dart';

String heroku = "https://kygm-mobile.herokuapp.com/";
String localhost = "http://localhost:1700/";

class ClientsApi {
  final _dio = Dio(BaseOptions(baseUrl: heroku));

  Future<List> getClients() async {
    final response = await _dio.get('');
    return response.data['client'];
  }

  Future<List> getTransactions() async {
    final response = await _dio.post('/getTransacts');
    return response.data['transaction'];
  }

  Future<String> testApi() async {
    final response = await _dio.get('');

    return response.toString();
  }
  Future<String> searchClient() async {
    final response = await _dio.post('/searchClient');
    return response.data['client'];
  }

  //inFName, inLName, inAddress, inCity, inState, inDes, inPhoneNum
  Future<Client> createClient(String fname, String lname, String address,
      String city, String state, String descript, String phoneNumber) async {
    final response = await _dio.post('/addClient', data: {
      'fname': fname,
      'lname': lname,
      'address': address,
      'city': city,
      'state': state,
      'phoneNumber': phoneNumber,
      'descript': descript
    });
    return Client.fromJson(response.data);
  }

  Future<Client> editClient(
      String id,
      String fname,
      String lname,
      String address,
      String city,
      String state,
      String phoneNumber,
      String description) async {
    final response = await _dio.post('/clientDetails', data: {
      'id': id,
      'fname': fname,
      'lname': lname,
      'address': address,
      'city': city,
      'state': state,
      'phoneNumber': phoneNumber,
      'description': description
    });
    return Client.fromJson(response.data);
  }

  Future<Transaction> createTransaction(
      String fname,
      String lname,
      String phoneNumber,
      String transactDate,
      String transactTime,
      String transactName,
      String descript,
      var transactCost,
      var transactPrice) async {
    final response = await _dio.post('/addTransaction', data: {
      'fname': fname,
      'lname': lname,
      'phoneNumber': phoneNumber,
      'transactDate': transactDate,
      'transactCost': transactCost,
      'transactPrice': transactPrice,
      'transactTime': transactTime,
      'descript': descript,
      'transactName': transactName,
      'dateEntered': DateTime.now().toString()
    });
  }

  Future deleteClient(String id) async {
    final response = await _dio.post('/deleteClient', data: {'id': id});
    return response.data;
  }

  Future deleteTransaction(String id) async {
    final response = await _dio.post('/deleteTransact', data: {'id': id});
    //print(id);
    return response.data;
  }
}

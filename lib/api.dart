import 'package:KYGM_Mobile/Models/transaction.dart';
import 'package:dio/dio.dart';

import './Models/client.dart';

class ClientsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:1600/'));

  Future<List> getClients() async {
    final response = await _dio.get('');
    return response.data['client'];
  }

  Future<List> getTransactions() async {
    final response = await _dio.get('/getTransacts');
    return response.data['transaction'];
  }

  Future<String> testApi() async {
    final response = await _dio.get('');

    return response.toString();
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
      String descript,
      String phoneNumber) async {
    final response = await _dio.post('/clientDetails', data: {
      'id': id,
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
      'phoneNumber' : phoneNumber,
      'transactDate': transactDate,
      'transactCost': transactCost,
      'transactPrice': transactPrice,
      'transactTime': transactTime,
      'descript': descript,
      'transactName' : transactName,
      'dateEntered' : DateTime.now().toString()
      
    });
  }

  Future deleteClient(String id) async {
    final response = await _dio.post('/deleteClient', data: {'_id': id});
    return response.data;
  }
}

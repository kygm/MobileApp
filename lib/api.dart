import 'package:dio/dio.dart';

import './Models/client.dart';

class ClientsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:1600/'));

  Future<List> getClients() async {
    final response = await _dio.get('');
    return response.data['client'];
  }
  Future<List> getTransactions() async{
    final response = await _dio.get('/getTransacts');
    return response.data['transaction'];
  }

  Future<String> testApi() async{
    final response = await _dio.get('');

    return response.toString();
  }
  //inFName, inLName, inAddress, inCity, inState, inDes, inPhoneNum
  Future<Client> createClient(String fname, String lname, String address, String city, String state, String descript, String phoneNumber) async {
    final response = await _dio.post('/addClient', data: { 'fname': fname, 'lname': lname, 'address' : address, 'city' : city, 'state': state, 'phoneNumber': phoneNumber,'descript': descript});
    return Client.fromJson(response.data);
  }

  Future deleteClient(String phoneNumber) async {
    final response = await _dio.delete('/$phoneNumber');
    return response.data;
  }
}

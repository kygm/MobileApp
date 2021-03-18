import 'package:dio/dio.dart';

import './Models/client.dart';

class ClientsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/'));

  Future<List> getClients() async {
    print("In getClients");
    final response = await _dio.get('');
    //print(response);
    //(response.data['client'] as List).map<Client>((json) => Client.fromJson(json)).toList()
    //print(response.data['client'].toString());
    return response.data['client'];
   // return (response.data['client'] as List)
    //.map<Client>((json) => Client.fromJson(json)).toList();
  }

  Future<String> testApi() async{
    final response = await _dio.get('');

    return response.toString();
  }
  Future<Client> createClient(String phoneNumber) async {
    final response = await _dio.post('', data: {'phoneNumber': phoneNumber});
    return Client.fromJson(response.data);
  }

  Future deleteClient(String phoneNumber) async {
    final response = await _dio.delete('/$phoneNumber');
    return response.data;
  }
}

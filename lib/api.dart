import 'package:dio/dio.dart';

import './Models/client.dart';

class ClientsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:1600/'));

  Future<List> getClients() async {
    print("In getClients");
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
  Future<Client> createClient(String phoneNumber) async {
    final response = await _dio.post('', data: {'phoneNumber': phoneNumber});
    return Client.fromJson(response.data);
  }

  Future deleteClient(String phoneNumber) async {
    final response = await _dio.delete('/$phoneNumber');
    return response.data;
  }
}

import 'package:dio/dio.dart';

import './Models/client.dart';

class ClientsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8081/'));

  Future<List<Client>> getClients() async {
    final response = await _dio.get('');
    return (response.data['clients'] as List)
        .map<Client>((json) => Client.fromJson(json))
        .toList();
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

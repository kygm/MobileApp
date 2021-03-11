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

  Future<Client> createContact(String name) async {
    final response = await _dio.post('', data: {'fname': name});
    return Client.fromJson(response.data);
  }

  Future deleteContact(String id) async {
    final response = await _dio.delete('/$id');
    return response.data;
  }
}
